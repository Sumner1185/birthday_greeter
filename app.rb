require 'sinatra/base'
require 'date'

class Birthday < Sinatra::Base
  set :session_secret, "something"
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/info' do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    redirect '/hbd'
  end

  get '/hbd' do
    @today_month = Date.today.strftime("%B").downcase
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]
    erb(:hbd)
  end
end


