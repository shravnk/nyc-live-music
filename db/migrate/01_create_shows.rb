class CreateShows < ActiveRecord::Migration[4.2]
	def change
		create_table :shows do |t|
			t.string :name
			t.string :age
			t.integer :price
			t.string :start_time
			t.integer :venue_id
			t.integer :artist_id
		end
	end
end