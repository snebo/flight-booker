class Flight < ApplicationRecord
  belongs_to :depart_from, class_name: "Airport", foreign_key: "departing_airport_id"
  belongs_to :arrive_at, class_name: "Airport", foreign_key: "arrival_airport_id"
end
