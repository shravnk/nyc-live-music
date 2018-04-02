class VenueController < ApplicationController
	get '/venues/signup' do
		erb :'/venues/signup'
	end

	post '/venues/signup' do
		if !params.value?("")
	  		user = Venue.create(username: params[:username], password: params[:password])
	  		user.save
	  		session[:id] = user.id
	  		redirect "/venues/#{user.slug}"
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

	  		redirect "/venues/#{user.slug}"
	  	else
	  		redirect '/venues/login'
	  	end
	end

	get "/venues/:slug" do 
		@user = Venue.find_by_slug(params[:slug])
		erb :'/venues/show'
	end
end

