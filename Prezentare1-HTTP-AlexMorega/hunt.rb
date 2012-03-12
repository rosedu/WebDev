require 'sinatra'

get '/' do
    "The chase is on!\nGET /page2\n"
end

get '/page2' do
    "You are at page two. Good for you.\nCheck out the 404 page!\n"
end

error 404 do
    "error, can haz no page :(\nbut try this one: /negotiate\n"
end

get '/negotiate' do
    if request.accept? 'text/plain'
        headers "Content-Type" => "text/plain"
        "ask me for text/html\n"
    else
        headers "Content-Type" => "text/html"
        "<p><strong>Good job!</strong> For next clue " +
        "go <a href=\"/here\">there</a>.</p>\n"
    end
end

get '/here' do
    redirect to('/somewhere')
end

get '/somewhere' do
    "Hey there. Your next clue is '/concert'.\n"
end

get '/concert' do
    "Post your name please. Also, send key=dingbat.\n"
end

post '/concert' do
    if params['key'] == 'dingbat' and params['name']
        "Hey #{params['name']}! Welcome to the concert!\n" +
        "The end. You win.\n"
    else
        "Your ticket is no good here. Try again.\n"
    end
end
