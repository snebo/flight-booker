class Flight < ApplicationRecord
  validate :same_flight

  belongs_to :departing_airport, class_name: "Airport", foreign_key: "depart_from"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrive_at"

  has_many :bookings
  has_many :passangers, through: :bookings

  def same_flight
    if depart_from == arrive_at
      errors.add(:arrive_at, "Can't be the same as departing")
    end
  end
end
