# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
store = Store.create({name: 'Walgreens'})

locations = Location.create([{store: store, latitude: '37.7923', longitude: '-122.4024', address: '300 Montgomery St, San Francisco, CA'}, 
                             {store: store, latitude: '37.7912', longitude: '-122.4007', address: '100 Sansome St, San Francisco, CA'}, 
                             {store: store, latitude: '37.8796', longitude: '-122.2965', address: '1050 Gilman St Berkeley, CA'}])

discounts = Discount.create([{store: store, location: locations.first, item: 'PBR', price: 10, percentage: 50}, 
                             {store: store, location: locations[1], item: 'Coors', price: 15, percentage: 40},
                             {store: store, location: locations[2], item: 'Budweiser', price: 12, percentage: 60}])