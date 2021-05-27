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
Holding.destroy_all
Stock.destroy_all

puts "...Creating stocks"


  10.times do
    Stock.create!(
      ticker: Faker::Finance.ticker,
      stock_price: rand(1.0..99.99).round(2),
      asset_type: Stock::ASSET_TYPES.sample
      )
  end
puts "created #{Stock.count} stocks"

puts "creating holdings"
  20.times do
    stock = Stock.all.sample
    Holding.create!(
      stock_id: stock.id,
      account_id: (Account.all.sample).id,
      shares: rand(1..10),
      purchase_price: (stock.stock_price * rand(0.5..1.5)).round(2)
      )
  end
puts "created #{Holding.count} holding"

