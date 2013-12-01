
FactoryGirl.define do
  factory :location do
    latitude '34.2384723'
    longitude '-123.3259842'
    address '123 Fake St, Someplace, WO'
  end

  factory :discount do
    location
    item "PBR"
    price  13
    percentage 50
  end
end  
