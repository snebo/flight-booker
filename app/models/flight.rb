class Flight < ApplicationRecord
  belongs_to :departing_airport, class_name: "Airport", foreign_key: "depart_from"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrive_at"
end
