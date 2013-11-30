class Api::V1::DiscountController < Api::V1::BaseController
  def index
    respond_with(Discount.all)
  end

  def create
    discount = Discount.create params[:discount]
    if discount.valid?
      respond_with(discount, :location => api_v1_discount_path(discount))
    else
      respond_with(discount)
    end
  end
end  