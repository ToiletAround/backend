class Toilet < ApplicationRecord
  has_one :price
  has_one :location
  has_many :schedules
  has_many :resources
end
