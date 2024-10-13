class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passangers, dependent: :destroy
  accepts_nested_attributes_for :passangers
end
