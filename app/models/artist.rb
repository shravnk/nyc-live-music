require_relative './concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
	has_many :shows
	has_many :venues, through: :shows
	has_many :fans, through: :shows
	
	has_secure_password

	extend Slugify::ClassMethods
  	include Slugify::InstanceMethods
end