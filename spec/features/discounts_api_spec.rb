require 'spec_helper'
require 'JSON'

describe 'The discounts API' do
  xit 'lists all discounts in the db' do
    store = create(:store)
    location = create(:location)
    discount = create(:discount, price: 10)

    visit stores_path

    response = JSON.parse(page.body)
 
    expect(response["discounts"]).to include(discount.price)
  end
end
