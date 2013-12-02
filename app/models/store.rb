class Store < ActiveRecord::Base
  attr_accessible :name
  has_many :discounts
  has_many :locations
  validates :name, presence: true

  def self.find_discounts locations
    locations.map do |locations|
      Discount.joins(:location).where(locations: {id: locations.id})
    end
  end

  def self.find_discount_locations discounts
    discounts.map do |location|
      unless location.first.nil?
        Location.find(location.first.location_id)
      end
    end
  end

  def self.find_discount_stores discount_locations
    discount_locations.map do |store|
      unless store.nil?
        Store.find(store.store_id)
      end
    end
  end
end