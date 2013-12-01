require 'spec_helper'

describe Store  do
    it { should validate_presence_of :name }
    it { should have_many :locations }
    it { should have_many :discounts }
end