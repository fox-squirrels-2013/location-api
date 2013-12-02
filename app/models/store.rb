class Store < ActiveRecord::Base
  attr_accessible :name
  has_many :discounts
  has_many :locations
  validates :name, presence: true

  def self.find_results current_position
    locations = Location.near(current_position, 3) 

    discounts = find_discounts locations
    discounts.reject! { |discount| discount.empty? }

    discount_locations = find_discount_locations discounts
    discount_stores = find_discount_stores discount_locations
    
    discount_price = self.find_discount_price discounts
    percentage = self.find_discount_percentage discounts
    item = self.find_discounted_item discounts

    coordinates = discount_locations.map { |discount| [discount.latitude, discount.longitude] }
    address = discount_locations.map(&:address)
    name = discount_stores.map(&:name)

    results = []
    ind = 0

    while ind < discount_price.length
      results << { "coordinate" => coordinates[ind],
        "name" => name[ind],
        "product" => item[ind],
        "price" => discount_price[ind],
        "discount" => percentage[ind],
        "address" => address[ind]
      }
      ind += 1
    end
    results
  end

  def self.find_discounts locations
    locations.map do |locations|
      Discount.joins(:location).where(locations: {id: locations.id})
    end.compact
  end

  def self.find_discount_locations discounts
    discounts.map do |location|
      Location.find(location.first.location_id)
    end
  end

  def self.find_discount_stores discount_locations
    discount_locations.map do |store|
      Store.find(store.store_id)
    end
  end

  def self.find_discount_price discounts
    discount_price = []

    discounts.each do |dprice|
      dprice.each do |inner_price|
        discount_price << "$#{inner_price.price}"
      end
    end
    discount_price
  end

  def self.find_discount_percentage discounts
    percentage = []

    discounts.each do |dpercentage|
      dpercentage.each do |inner_percentage|
        percentage << "#{inner_percentage.percentage}%"
      end
    end
    percentage
  end

  def self.find_discounted_item discounts
    item = []

    discounts.each do |discount|
      discount.each do |inner_discount|
        item << inner_discount.item
      end
    end
    item
  end
end