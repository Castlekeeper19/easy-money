# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'uri'
# require 'net/http'
# require 'openssl'

# url = URI("https://alpha-vantage.p.rapidapi.com/query?function=GLOBAL_QUOTE&symbol=TSLA")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = '8e5f93ae25msh506ca700c9c8e13p19e4a9jsnc5a2c8083450'
# request["x-rapidapi-host"] = 'alpha-vantage.p.rapidapi.com'

# response = http.request(request)
# puts response.read_body


require "faker"

puts "...clearing database"

puts "...Creating stocks"


  20.times do
    Stock.create!(
      ticker: Faker::Finance.ticker,
      stock_price: rand(1.0..99.99).round(2),
      asset_type: Stock::ASSET_TYPES.sample
      )
  end
puts "created #{Stock.count} stocks"



require "faker"

puts "...clearing database"

User.destroy_all
Workout.destroy_all

puts "...Creating Users & Workouts"



10.times do
  User.create!(
      name:  Faker::Name.name
      location: Faker::Address.street_address
      email: Faker::Internet.email
      password: Faker::Internet.password
  )
    1.times do
      Workout.create!(
      category: Workout::CATEGORY.sample,
      location: Faker::Address.street_address,
      name: Faker::Verb.ing_form
      user_id:


  )
  end
end
