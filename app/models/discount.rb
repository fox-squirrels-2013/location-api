class Discount < ActiveRecord::Base
  attr_accessible :percentage, :item, :price
  validates_presence_of :percentage, :item, :price
  belongs_to :location
end  