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
    @user = current_user
    erb :'/home'
  end

  get '/edit_profile' do
    @user = current_user
    path = @user.class.name.downcase + 's'
    erb :"/#{path}/edit"
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do

    def logged_in?
      !!session[:id]
    end


    def current_user
      id = session[:id]
      type = session[:type]
      case type
        when 'Venue'
          return Venue.find(id)
        when 'Artist' 
          return Artist.find(id)
        when 'Fan'
          return Fan.find(id)
       end
    end

    def future_shows 
      Show.all.select{|show| show.start_time > Time.now}.sort_by!{|s| s.start_time}
    end

    def past_shows
      Show.all.select{|show| show.start_time < Time.now}.sort_by!{|s| s.start_time}
    end
  end
end