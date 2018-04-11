class Show < ActiveRecord::Base
	belongs_to :venue
	belongs_to :artist
	has_many :fan_shows
	has_many :fans, through: :fan_shows

	validates :name, presence: true
	validates :start_time, presence: true
	validates :venue_id, presence: true
	validates :artist_id, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0}


	extend Slugify::ClassMethods
  	include Slugify::InstanceMethods
end