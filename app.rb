require 'sinatra/base'

class Birthday < Sinatra::Base
enable :sessions


get '/' do
  erb(:index)
end

post '/info' do
  session[:name] = params[:name]
  $name = session[:name]
  p $name
  redirect '/hbd'
end

get '/hbd' do
  p $name
  erb(:hbd)
end
end


