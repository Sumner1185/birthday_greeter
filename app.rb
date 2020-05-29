require 'sinatra/base'

class Birthday < Sinatra::Base
  set :session_secret, "something"
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/info' do
    session[:name] = params[:name]
    p "This is in info "  
    p session
    #$name = session[:name]

    redirect '/hbd'
  end

  get '/hbd' do
    p "This is in hbd " 
    p session
    @name = session[:name]
    erb(:hbd)
  end
end


