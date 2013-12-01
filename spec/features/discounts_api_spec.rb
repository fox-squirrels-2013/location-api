require 'spec_helper'
require 'JSON'

describe 'The discounts API' do
  it 'lists all discounts in the db' do
    store = create(:store)
    location = create(:location)
    discount = create(:discount, price: 10)

    visit store_location_discounts_path(discount.store, discount.location)

    response = JSON.parse(page.body)
 
    expect(response["discounts"]).to include(discount.price)
  end
end
