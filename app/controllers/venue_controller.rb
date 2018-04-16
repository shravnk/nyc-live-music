class VenueController < ApplicationController

	get '/venues' do
		@venues = Venue.all
		erb :'/venues/all'
	end
	get '/venues/signup' do
		erb :'/venues/signup'
	end

	post '/venues/signup' do
		if !params.value?("")
			if Venue.find_by(username: params[:username])
				redirect "/venues/signup"
			else
				user = Venue.create(username: params[:username], password: params[:password])
		  		user.save
		  		session[:id] = user.id
		  		session[:type] = user.class.name
		  		redirect "/home"
		  	end
	  	else
	  		redirect "/venues/signup"
	  	end
	end


	get '/venues/login' do
		erb :'/venues/login'
	end

	post '/venues/login' do
		user = Venue.find_by(username: params['username'])

	  	if user
	  		session[:id] = user.id
	  		session[:type] = user.class.name
	  		redirect "/home"
	  	else
	  		redirect '/venues/login'
	  	end
	end

	get '/venues/create_show' do
		erb :'/venues/create_show'
	end

	get "/venues/:slug" do 
		@user = Venue.find_by_slug(params[:slug])
		erb :'/venues/show'
	end

	post '/venues/:slug/edit' do
		@user = Venue.find_by_slug(params[:slug])
		@user.name = params[:name]
		@user.bio = params[:bio]
		@user.address = params[:address]
		@user.save
		redirect '/home'
	end



end

