class Store < ActiveRecord::Base
  attr_accessible :name
  has_many :discounts
  has_many :locations
  validates :name, presence: true

end