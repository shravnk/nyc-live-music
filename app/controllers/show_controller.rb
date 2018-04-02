class ShowController < ApplicationController
	post '/shows/new' do
		
		show = Show.create(name: params[:name], price: params[:price], age: params[:age], venue_id: params[:venue_id])
		#can't simply pass params array because of 'captures' key
		
		show.save
		redirect "/shows/#{show.id}"
	end

	get '/shows/:id' do
		@show = Show.find(params[:id])
		erb :'/shows/show'
	end
end