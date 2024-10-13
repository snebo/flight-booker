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

100.times do
  coming = airports.sample.id
  going = airports.sample.id

  # Ensure depart_from and arrive_at are different
  while coming == going
    going = airports.sample.id
  end

  # Random flight details
  flight_date = Faker::Time.between(from: DateTime.now, to: 1.month.from_now)
  timeline = flight_date + rand(1..12).hours
  amount = rand(2..20)

  # Find or create flight by depart_from, arrive_at, and start_date
  Flight.find_or_create_by!(
    depart_from: coming,
    arrive_at: going,
    start_date: flight_date
  ) do |flight|
    # Only set these values if the flight does not already exist
    flight.duration = timeline
    flight.seats = amount
  end
end
