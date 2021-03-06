class Fan < ActiveRecord::Base
	has_many :fan_shows
	has_many :shows, through: :fan_shows
	has_many :artists, through: :shows
	has_many :venues, through: :shows

	has_secure_password
	
  	extend Slugify::ClassMethods
  	include Slugify::InstanceMethods	
end