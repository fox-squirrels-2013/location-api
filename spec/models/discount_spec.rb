require 'spec_helper'

describe Discount do
  it { should belong_to(:location) }
  xit { should belong_to(:store) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:item) }
  it { should validate_presence_of(:percentage) }
end