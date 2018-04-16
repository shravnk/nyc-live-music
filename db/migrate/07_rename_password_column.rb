class RenamePasswordColumn < ActiveRecord::Migration[4.2]
	def change
		rename_column :artists, :password, :password_digest
		rename_column :venues, :password, :password_digest
		rename_column :fans, :password, :password_digest
	end
end