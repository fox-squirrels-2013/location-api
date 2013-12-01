
FactoryGirl.define do
  factory :store do
    name 'PBR r Us'
  end

  factory :location do
    store
    latitude '34.2384723'
    longitude '-123.3259842'
    address '123 Fake St, Someplace, WO'
  end

  factory :discount do
    location
    store
    item "PBR"
    price  13
    percentage 50
  end
end  
