require "ostruct"
require "bundler/setup"

Bundler.require :default # , ENV["RACK_ENV"]

# Categoriile de intrebari
class Category < ActiveRecord::Base
  # Reprezinta faptul ca o categorie poate avea mai multe intrebari
  # Daca rulam: category.questions, ne va returna un array cu intrebarile
  # asociate categoriei curente
  has_many :questions
end

class Question < ActiveRecord::Base
  # TODO: Specificati faptul ca fiecare intrebare poate avea mai multe raspunsuri
  has_many :responses

  # Aceasta intrebare apartine unui utilizator, care are id-ul identic cu ce se
  # gaseste in coloana "user_id"
  # Pentru a gasi utilizatorul, putem apela: question.user, care ne va returna user-ul
  belongs_to :user

  # Aceasta intrebare apartine unei categorii ce are id-ul identic cu cel din coloana category_id
  # Pentru a gasi categoria, putem apela: question.category
  belongs_to :category
end

class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :questions
  has_many :responses

  before_save :encrypt_password

  def has_password?(submitted_password)
    self.encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    # TODO1: Cautati in tabela User, user-ul care are email-ul de la parametru
    # HINT: User.where(...)

    # TODO2: Verificati daca submitted_password corespunde cu parola criptata a user-ului
    # HINT: Folositi has_password?, iar ca sa stiti ce sa-i dati ca parametru studiati metoda encrypt_password

    return nil
  end

  def self.authenticate_with_salt(email, salt)
    # TODO1: Cautati in tabela User, user-ul care are email-ul de la parametru
    # HINT: User.where(...)

    # TODO2: Verificati daca atributul lui "salt" este egal cu parametrul salt
    #        Daca da, atunci returnati user-ul
    #        Daca nu, atunci returnati nil

    return nil
  end

  private

    def encrypt_password
      # Verificam daca user-ul are parola criptata sau daca user-ul si-a updatat parola
      # si in functie de caz, cream/updatam salt-ul
      unless has_password?(password)
        self.salt = encrypt("#{Time.now.utc}--#{password}")
      end

      # Salvam parola criptata in baza de date
      self.encrypted_password == encrypt("#{self.salt}--#{password}")
    end

    # Metoda de criptare a parolei
    def encrypt(pass)
      Digest::SHA2.hexdigest(pass)
    end
end

class Miniflow < Sinatra::Base
  enable :static
  enable :sessions

  CATEGORIES = ["ruby", "web", "sinatra", "webdev"]
  configure do
    # Conectare la baza de date locala
    set :database, "sqlite://development.sql"

    begin
      if Category.all.size == 0
        CATEGORIES.each do |category|
          Category.create!(:name => category)
        end
      end
    rescue => e
      puts "Category table could not be found. Please run 'rake db:migrate'"
    end
  end

  helpers do
    # Metoda aceasta va returna utilizatorul logat
    def current_user
      user_email = user_salt = nil
      if !session[:remember_token].nil?
        user_email = session[:remember_token].split("_")[0]
        user_salt  = session[:remember_token].split("_")[1]
      end

      return User.authenticate_with_salt(user_email, user_salt)
    end

    # Aceasta metoda transforma inlocuieste caracterele diferite de cele alfanumerice cu "-"
    # Am folosit aceasta metoda ca sa facem URL-uri mai dragute
    # Exemplu: slugify("ana are mere") -> "ana-are-mere"
    def slugify(title = "")
      slug = title.dup
      slut = title 
      slug.downcase!
      slug.gsub /\s+/, '-'
    end
  end

  # Pagina basic
  get "/" do
    @questions = Question.all
    @categories = Category.all
    erb :index
  end

  # Actiunea in care se creaza intrebarea
  post "/questions" do
    # Gasim categoria din care face parte intrebarea
    category = Category.where(:name => params[:category]).first

    # Cream intrebarea
    question = Question.new(params[:question])
    question.rating      = 0
    question.created_at  = Time.now
    question.category_id = category.id

    # Cautam user-ul care a postat intrebarea, iar daca nu-l gasim, il cream
    user = User.where(:name => params[:author][:name], :email => params[:author][:email]).first
    if user.nil?
      # TODO: Dupa ce faceti autentificarea, aici va fi user-ul curent
      user = User.new(params[:author])
      user.created_at = Time.now
      user.password   = "student"
      if !user.save
        @error_message = "A fost o eroare cand am salvat utilizatorul. Incearca din nou"
        redirect_to "/"
        return
      end
    end

    question.user_id = user.id
    if !question.save
      @error_message = "A fost o eroare cand am salvat utilizatorul. Incearca din nou"
    end

    redirect "/"
  end

  # Pagina in care se va afisa intrebarea impreuna cu raspunsurile ei
  get "/question/:id" do
    if !params[:id]
      redirect_to "/"
      return
    end

    @question = Question.find(params[:id].to_i)
    @responses = []

    erb :show
  end

  # Creare de raspuns
  post "/response" do
    user = User.where(:email => params[:author][:email], :name => params[:name]).first
    if !user
      user = User.create!(:email => params[:author][:email], :name => params[:author][:name])
    end

    # TODO1: Salvati raspunsul in baza de date
    # Hint: Aveti grija, ca la coloana question_id, sa puneti id-ul intrebarii

    redirect "/question/#{question.id}-#{slugify(question.title)}"
  end

  # Formularul de creare de utilizatori
  get "/sign_up" do
    erb :sign_up
  end

  # Aici se vor crea utilizatorii
  post "/sign_up" do
    user = User.new(params[:user])
    if user.save
      session[:remember_token] = "#{user.email}_#{user.salt}"
    end
    redirect "/"
  end

  # Formularul de autentificare
  get "/sign_in" do
    erb :sign_in
  end

  # Aici se vor autentifica
  post "/sessions/create" do
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if !user.nil?
      # Salvam datele de autentificare ale utilizatorului, in sesiune
      session[:remember_token] = "#{user.email}_#{user.salt}"
    end

    redirect "/"
  end

  # Aici utilizatorul va iesi din contul sau
  get "/sign_out" do
    session[:remember_token] = nil
    redirect "/"
  end
end
