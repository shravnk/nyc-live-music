class RenameFanshowColumn < ActiveRecord::Migration[4.2]
	def change
		rename_column :fan_shows, :genre_id, :show_id
	end
end