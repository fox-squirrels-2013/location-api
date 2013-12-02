require 'spec_helper'

describe Store  do
  it { should validate_presence_of :name }
  it { should have_many :locations }
  it { should have_many :discounts }

  let(:current_position) { [34.2384723,-123.3259842] }
  let(:nearby_position) { [34.2384722, -123.3259843] }
  let!(:locations) { create(:location) }
  let!(:discounts) { create(:discount) }
  let!(:stores) { create(:store) }

  context 'will output relevant disounts within the specified radius' do
    it 'is formatted correctly' do
      discount = Store.find_results current_position
      expect(discount.first["product"]).to eq "PBR"
    end
  end
end