class Place < ActiveRecord::Base
	has_many :checkin
	has_many :users, through: :checkin

	validates :country, :presence => true
	validates :state, :presence => true
	validates :city, :presence => true
	validates :latitude, :presence => true
	validates :longitude, :presence => true
end
