class StoresController < ApplicationController
  def index
    current_position = [params[:latitude].to_f, params[:longitude].to_f]
    
    locations = Location.near(current_position, 3) 
    discounts = Store.find_discounts locations
    discount_locations = Store.find_discount_locations discounts
    discount_stores = Store.find_discount_stores discount_locations

    render json: { discounts: discounts, locations: discount_locations, stores: discount_stores  }
  end
end  
