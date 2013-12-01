class DiscountsController < ApplicationController

  def index
    discounts = Discount.all.map(&:price)
    render json: { discounts: discounts }
  end

  def create
    discount = Discount.new params[:discount]
    if discount.save
      render json: { error: false, discount: discount, location: discount_path(discount)}
    else
      render json: { error: true }
    end
  end
end  
