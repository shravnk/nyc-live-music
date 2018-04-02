class FanController < ApplicationController
	get '/fans/signup' do
		erb :'/fans/signup'
	end

	post '/fans/signup' do
		if !params.value?("")
	  		user = Fan.create(username: params[:username], password: params[:password])
	  		user.save
	  		session[:id] = user.id
	  		session[:type] = user.class.name
	  		redirect "/home"
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
end