require 'date'
class ShowController < ApplicationController
	get '/shows' do 
		erb :'/shows/all'
	end

	post '/shows/new' do
		d = params[:date]
		t = params[:time]
		dt = d + " " + t
		binding.pry
		show = Show.create(name: params[:name], price: params[:price], age: params[:age], venue_id: params[:venue_id], start_time: dt, artist_id: params[:artist])
		#can't simply pass params array because of 'captures' key
		binding.pry
		show.save
		redirect "/shows/#{show.id}"
	end

	post '/shows/add_fan' do

		fanshow = FanShow.find_or_create_by(fan_id: session[:id], show_id: params[:show_id])
		fanshow.save
		redirect "/shows/#{params[:show_id]}"
	end

	get '/shows/:id' do
		@show = Show.find(params[:id])
		erb :'/shows/show'
	end
end