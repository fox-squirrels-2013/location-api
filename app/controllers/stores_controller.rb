class StoresController < ApplicationController
  def index
     # save request params in variable
    #@current_position = params
    # check radius arounf current position
    @surrounding_locations = Location.near([37.79235, -122.4061], 1)    

   # discounts = Discount.all.map(&:price)
    render json: { surrounding_locations: @surrounding_locations }
  end
end  