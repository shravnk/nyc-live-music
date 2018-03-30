class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "session"
    set :views, 'app/views'
  end



  helpers do

    def logged_in?
      !!session[:user_id]
    end


    def current_user
      User.find(session[:user_id])
    end
  end