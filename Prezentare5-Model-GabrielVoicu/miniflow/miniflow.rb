require "ostruct"
require "bundler/setup"

Bundler.require :default# , ENV["RACK_ENV"]

class Category < ActiveRecord::Base
  has_many :questions
end

class Question < ActiveRecord::Base
  has_many :responses

  belongs_to :user
  belongs_to :category
end

class User < ActiveRecord::Base
  has_many :questions
  has_many :responses

  before_save :encrypt_password

  def has_password?(submitted_password)
    self.encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?("#{user.salt}--#{submitted_password}")
  end

  def self.authenticate_with_salt(email, salt)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.salt == salt
  end

  private

    def encrypt_password
      unless has_password?(password)
        self.salt = encrypt("#{Time.now.utc}--#{password}")
      end

      self.encrypted_password = encrypt("#{self.salt}--#{password}")
    end

    def encrypt(pass)
      Digest::SHA2.hexdigest(pass)
    end
end

class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
end

class Miniflow < Sinatra::Base
  enable :static
  enable :sessions
  #enable :cookies

  CATEGORIES = %w[ ruby sinatra web development ]
  configure do
    #set :questions, []
    #set :categories, CATEGORIES
    set :database, "sqlite://development.sql"

    if Category.all.size == 0
      CATEGORIES.each do |category|
        Category.create!(:name => category)
      end
    end
  end

  helpers do
    def current_user
      user_email = user_salt = nil
      if !session[:remember_token].nil?
        user_email = session[:remember_token].split("_")[0]
        user_salt  = session[:remember_token].split("_")[1]
      end

      User.authenticate_with_salt(user_email, user_salt)
    end

    def slugify(title = "")
      slug = title.dup
      slug.downcase!
      slug.gsub /\s+/, '-'
    end
  end

  get "/" do
    @questions = Question.all
    @categories = Category.all
    erb :index
  end

  post "/questions" do
    category = Category.where(:name => params[:category]).first
    question = Question.new(params[:question])
    question.rating      = 0
    question.created_at  = Time.now
    question.category_id = category.id

    user = User.where(:name => params[:author][:name], :email => params[:author][:email]).first
    if user.nil?
      # User-ul nu exista, asa ca il cream
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

  get "/question/:id" do
    if !params[:id]
      redirect_to "/"
      return
    end

    @question = Question.find(params[:id].to_i)
    @responses = @question.responses

    erb :show
  end

  post "/response" do
    user = User.where(:email => params[:author][:email], :name => params[:author][:name]).first
    if !user
      user = User.create!(:email => params[:author][:email], :name => params[:author][:name])
    end

    question = Question.find(params[:question_id])
    # TODO: Creati raspunsul la intrebare
    response = question.responses.build(params[:response])
    response.user_id = user.id
    response.score = 0
    response.save

    redirect "/question/#{question.id}-#{slugify(question.title)}"
  end

  get "/sign_up" do
    erb :sign_up
  end

  post "/sign_up" do
    user = User.new(params[:user])
    if user.save
      session[:remember_token] = "#{user.email}_#{user.salt}"
    end
    redirect "/"
  end

  get "/sign_in" do
    erb :sign_in
  end

  post "/sessions/create" do
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if !user.nil?
      session[:remember_token] = "#{user.email}_#{user.salt}"
    end

    redirect "/"
  end

  get "/sign_out" do
    session[:remember_token] = nil
    redirect "/"
  end
end
