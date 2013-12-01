require 'spec_helper'

describe Location do
  it { should have_many(:discounts) }
  it { should belong_to(:store) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:address) }
end