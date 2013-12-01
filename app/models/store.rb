class Store < ActiveRecord::Base
  has_many :discounts
  has_many :locations
  validates :name, presence: true

end