class < ActiveRecord::Migration
	def change
		create_table :fans do |t|
			t.string :name
			t.string :bio
		end
	end
end