require_relative './concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
	has_many :shows
	has_many :venues, through: :shows
	has_many :fans, through: :shows

	extend Slugify::ClassMethods
  	include Slugify::InstanceMethods
end