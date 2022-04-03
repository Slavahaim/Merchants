# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |num|
  User.create(
    email: Faker::Internet.email, 
    password: '123456',
    nickname: Faker::Internet.username,
    role: 0
  )
end

5.times do |num|
  User.create(
    email: Faker::Internet.email, 
    password: '123456',
    nickname: Faker::Internet.username,
    role: 1
  )
end

5.times do |num|
  Merchant.create(
    name: Faker::Company.name , 
    city: Faker::Address.city , 
    street: Faker::Address.street_address , 
    country_code: Faker::Address.zip, 
    extra_info: {phone_number: Faker::PhoneNumber.unique.cell_phone, website: Faker::Internet.url} )
  #Merchant.create(name: Faker::Company.name, city: "City_#{i+1}", street: "street_#{i+1}", country_code: "#{i}12345#{i}", extra_info: {phone_number: "+123-123-123#{i}", website: "http://example#{i}.com"})
end