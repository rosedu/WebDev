require 'sinatra'

get '/' do
  erb :register
end

get '/register' do
  erb :register_ok
end

post '/register' do
  erb :register_ok
end
