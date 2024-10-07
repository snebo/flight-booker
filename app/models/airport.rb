class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", foreign_key: "depart_from"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrive_at"
end
