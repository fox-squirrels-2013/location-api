class DiscountsController < ApplicationController

  def index
    @discounts = Discount.all.map(&:price)
    # save request params in variable
   #  @current_position = params
   #  # check radius arounf current position
   #  @surrounding_locations = Location.near([@current_position.lat, @current_position.long], 1)    

   # # discounts = Discount.all.map(&:price)
    render json: { discounts:key => "value",  @discounts :key => "value", }
  end

  def create
    discount = Discount.new params[:discount]
    if discount.save
      render json: { error: false, discount: discount, location: location_discount_path(discount.location, discount)}
    else
      render json: { error: true }
    end
  end
end  
