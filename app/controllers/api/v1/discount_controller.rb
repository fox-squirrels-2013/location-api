class Api::V1::DiscountController < Api::V1::BaseController
  def index
    respond_with(Discount.all)
    
  end
end  