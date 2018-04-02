class Show < ActiveRecord::Base
	belongs_to :venue
	belongs_to :artist
	has_many :fan_shows
	has_many :fans, through: :fan_shows

	extend Slugify::ClassMethods
  	include Slugify::InstanceMethods
end