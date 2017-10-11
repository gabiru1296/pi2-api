class Feeder < ApplicationRecord
  belongs_to :tank
  has_many :sensors
end
