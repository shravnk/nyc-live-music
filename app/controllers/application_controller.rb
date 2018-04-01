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

  helpers do

    def logged_in?
      !!session[:user_id]
    end


    def current_user
      User.find(session[:user_id])
    end
  end
end