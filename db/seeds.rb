# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |i|
  #Merchant.create(name: Faker::Company.name , city: Faker::Address.city , street: Faker::Address.street_address , country_code: Faker::Address.zip )
  Merchant.create(name: "Company ##{i}", city: "City_#{i}", street: "street_#{i}", country_code: "#{i}12345#{i}")
end