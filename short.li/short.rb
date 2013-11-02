class Short < Sinatra::Base
  enable :static
  enable :sessions

  get "/" do
    erb :index
  end

  post "/shorten" do
    url = Url.create(params[:url])
    
    redirect "/u/#{url.slug}"
  end

  get "/u/:slug" do
    url = Url.find_by_slug(params[:slug])
    
    # Daca nu gasim URL-ul, inseamna ca el nu exista
    return erb(:not_found) unless url
    
    @original_url  = url.original
    @shortened_url = "#{request.base_url}/#{url.slug}"
    
    erb :show
  end
  
  get "/:slug" do
    url = Url.find_by_slug(params[:slug])
    
    # Daca nu gasim URL-ul, inseamna ca el nu exista
    return erb(:not_found) unless url 
    
    redirect url.original
  end
end
