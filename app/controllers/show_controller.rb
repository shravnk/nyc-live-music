require 'date'
class ShowController < ApplicationController
	get '/shows' do 
		erb :'/shows/all'
	end

	post '/shows/new' do
		d = params[:date]
		t = params[:time]
		dt = d + " " + t
		show = Show.create(name: params[:name], price: params[:price], age: params[:age], venue_id: params[:venue_id], start_time: dt, artist_id: params[:artist])
		#can't simply pass params array because of 'captures' key
		
		show.save
		redirect "/shows/#{show.id}"
	end

	get '/shows/:id' do
		@show = Show.find(params[:id])
		erb :'/shows/show'
	end
end