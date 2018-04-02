class CreateArtists < ActiveRecord::Migration[4.2]
	def change
		create_table :artists do |t|
			t.string :username
			t.string :password
			t.string :name
			t.string :bio
		end
	end
end