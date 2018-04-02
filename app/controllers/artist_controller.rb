class ArtistController < ApplicationController
	get '/artists/signup' do
		erb :'/artists/signup'
	end

	post '/artists/signup' do
		if !params.value?("")
	  		user = Artist.create(username: params[:username], password: params[:password])
	  		user.save
	  		session[:id] = user.id
	  		session[:type] = user.class.name
	  		redirect "/home"
	  	else
	  		redirect "/artists/signup"
	  	end
	end


	get '/artists/login' do
		erb :'/artists/login'
	end

	post '/artists/login' do
		user = Artist.find_by(username: params['username'])

	  	if user
	  		session[:id] = user.id
	  		session[:type] = user.class.name
	  		redirect "/home"
	  	else
	  		redirect '/artists/login'
	  	end
	end

	get "/artists/:slug" do 
		@user = Artist.find_by_slug(params[:slug])
		erb :'/artists/show'
	end
end