class CreateVenues < ActiveRecord::Migration[4.2]
	def change
		create_table :venues do |t|
			t.string :username
			t.string :password
			t.string :name
			t.string :bio
			t.string :address
		end
	end
end