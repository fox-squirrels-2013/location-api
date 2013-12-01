require 'spec_helper'
require 'JSON'

describe 'The discounts API' do
  it 'lists all discounts in the db' do
    location = create(:location)
    discount = create(:discount, price: 10)

    visit location_discounts_path(location.id)

    response = JSON.parse(page.body)
 
    expect(response["discounts"]).to include(discount.price)
  end
end
