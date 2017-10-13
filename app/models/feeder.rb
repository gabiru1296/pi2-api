class Feeder < ApplicationRecord
  belongs_to :tank
  has_many :sensors, dependent: :destroy
  has_many :consumptions
  has_many :lots, through: :consumptions
end
