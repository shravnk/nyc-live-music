require './config/environment.rb'
require 'pry'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "session"
    set :views, 'app/views'
  end

  get '/' do
    erb :landing
  end

  get '/home' do
    id = session[:id]
    type = session[:type]
    case type
      when 'Venue'
        @user = Venue.find(id)
      when 'Artist' 
        @user = Artist.find(id)
      when 'Fan'
        @user = Fan.find(id)
     end

    erb :'/home'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do

    def logged_in?
      !!session[:id]
    end


    # def current_user
    #   User.find(session[:user_id])
    # end
  end
end