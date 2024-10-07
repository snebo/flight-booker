# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'faker'
[ "SFO", "NYC", "TXA", "OHI", "kNY" ].each do |airport|
  Airport.find_or_create_by!(code: airport)
end

airports = Airport.all

20.times do |flight|
  coming = airports.sample.id
  going = airports.sample.id
  while coming == going 
    going = airports.sample.id
  end
  flight_date = Faker::Time.between(from: DateTime.now, to: 1.year.from_now)
  timeline = flight_date + rand(1..12).hours
  amount = rand(2..30)

  Flight.find_or_create_by!(
    depart_from: coming,
    arrive_at: going,
    start_date: flight_date,
    duration: timeline,
    seats: amount,
  )
end
