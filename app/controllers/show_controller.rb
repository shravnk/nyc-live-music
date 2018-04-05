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

	post '/shows/add_fan' do
		fanshow = FanShow.find_or_create_by(fan_id: session[:id], show_id: params[:show_id])
		fanshow.save
		redirect "/shows/#{params[:show_id]}"
	end

	get '/shows/:id' do
		@show = Show.find(params[:id])
		erb :'/shows/show'
	end

	get '/shows/:id/edit' do 
		@show = Show.find(params[:id])
		erb :'/shows/edit_show'
	end

	patch '/shows/:id' do
		d = params[:date]
		t = params[:time]
		dt = d + " " + t
		@show = Show.find(params[:id])
		@show.name = params[:name]
		@show.price = params[:price]
		@show.age = params[:age]
		@show.venue_id = params[:venue_id]
		@show.start_time = dt
		@show.artist_id = params[:artist]
		@show.save

		redirect "/shows/#{@show.id}"
	end
end