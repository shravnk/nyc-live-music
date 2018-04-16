class FanController < ApplicationController

	get '/fans' do
		@fans = Fan.all
		erb :'/fans/all'
	end

	get '/fans/signup' do
		erb :'/fans/signup'
	end

	post '/fans/signup' do
		if !params.value?("")
			if Fan.find_by(username: params[:username])
				redirect "/fans/signup"
			else
		  		user = Fan.create(username: params[:username], password: params[:password])
		  		user.save
		  		session[:id] = user.id
		  		session[:type] = user.class.name
		  		redirect "/home"
		  	end
	  	else
	  		redirect "/fans/signup"
	  	end
	end


	get '/fans/login' do
		erb :'/fans/login'
	end


	post '/fans/login' do
		user = Fan.find_by(username: params['username'])

	  	if user
	  		session[:id] = user.id
	  		session[:type] = user.class.name
	  		redirect "/home"
	  	else
	  		redirect '/fans/login'
	  	end
	end

	get "/fans/:slug" do 
		@user = Fan.find_by_slug(params[:slug])
		erb :'/fans/show'
	end

	post '/fans/:slug/edit' do
		@user = Fan.find_by_slug(params[:slug])
		@user.name = params[:name]
		@user.bio = params[:bio]
		@user.save
		redirect '/home'
	end
end