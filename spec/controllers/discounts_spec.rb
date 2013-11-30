require 'spec_helper'

describe Api::V1::DiscountController do
  
  before do 
    @discount = build(:discount)
  end


  context "discounts available " do

    let(:url) { "/index" }
    it "json" do 
      get "#{url}.json"

      discounts_json = Discount.all.to_json
      last_response.body.should eql(discounts_json)
      last_response.status.should eql(200)

      discounts = JSON.parse(last_response.body)

      discounts.any? do |d|
        d["discount"]["item"] == "PBR1"
      end.should be_true
    end  
  end
end
