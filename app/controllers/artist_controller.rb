class ArtistController < ApplicationController
	get '/artists' do
		@artists = Artist.all
		erb :'/artists/all'
	end

	get '/artists/signup' do
		erb :'/artists/signup'
	end

	post '/artists/signup' do
		if !params.value?("")

			if Artist.find_by(username: params[:username])
				redirect "/artists/signup"
			else
		  		user = Artist.create(username: params[:username], password: params[:password])
		  		user.save
		  		session[:id] = user.id
		  		session[:type] = user.class.name
		  		redirect "/home"
	  		end
	  	else
	  		redirect "/artists/signup"
	  	end
	end


	get '/artists/login' do
		erb :'/artists/login'
	end

	post '/artists/login' do
		user = Artist.find_by(username: params['username'])

	  	if user && user.authenticate(params[:password])
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

	post '/artists/:slug/edit' do
		@user = Artist.find_by_slug(params[:slug])
		@user.name = params[:name]
		@user.bio = params[:bio]
		@user.save
		redirect '/home'
	end

end