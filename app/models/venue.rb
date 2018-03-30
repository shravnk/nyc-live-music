class Venue < ActiveRecord::Base
	has_many :shows
	has_many :artists, through: :shows
	has_many :fans, through: :shows
end