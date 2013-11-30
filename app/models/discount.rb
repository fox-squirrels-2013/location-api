class Discount < ActiveRecord::Base
  validates_presence_of :percentage, :item, :price
end  