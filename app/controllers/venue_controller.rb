class VenueController < ApplicationController
	get '/venues/signup' do
		erb :'/venues/signup'
	end

	post '/venues/signup' do
		if !params.value?("")
	  		@venue = Venue.create(params)
	  		@venue.save
	  		session[:id] = @venue.id
	  		redirect "/venues/show"
	  	else
	  		redirect '/venues/signup'
	  	end
	end
	end


	get '/venues/login' do
		erb :'/venues/login'
	end

	post '/venues/login' do

	end

	get '/venues/show' do 
		
	end
end
