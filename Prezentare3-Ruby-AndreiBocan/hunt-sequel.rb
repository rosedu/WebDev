require 'rubygems'
require 'sinatra'

get '/' do
%{<html><body><h1>#{params["name"]} e gras</h1>
<p>Maxim e ala din spate care bea cafea</p>\
<pre>#{params.inspect}</pre>
</body></html>}
end

get '/maxim' do
%{<html><body><h1>Cine e gras?</h1>
<form method="POST">
  <label>Cine?</label>
  <input type="text" name="name" />
  <input type="submit" />
</form>
</body></html>}
end

post '/maxim' do
%{<html><body>#{params.inspect}</body></html>}
end
