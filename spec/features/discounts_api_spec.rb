require 'spec_helper'
require 'JSON'

describe 'The discounts API' do
  it 'lists all discounts in the db' do
    discount = create(:discount, price: 10)

    visit discounts_path

    response = JSON.parse(page.body)
 
    expect(response["discounts"]).to include(discount.price)
  end
end
