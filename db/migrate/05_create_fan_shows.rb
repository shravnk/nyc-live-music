class CreateFanShows < ActiveRecord::Migration[4.2]
	def change
		create_table :fan_shows do |t|
			t.integer :fan_id
			t.integer :genre_id
		end
	end
end