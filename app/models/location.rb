class Location < ActiveRecord::Base
  validates_presence_of :address, :longitude, :latitude
  geocoded_by :address
  has_many :discounts
  belongs_to :store
end