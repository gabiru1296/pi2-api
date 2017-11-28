class Feeder < ApplicationRecord
  belongs_to :tank, optional: true
  has_many :sensors, dependent: :destroy
  has_many :consumptions
  has_many :lots, through: :consumptions
  has_many :feeder_clocks

  before_save :verify_need_setup, on: [:update]

  def verify_need_setup
    if self.tank != nil  && self.nickname != nil
      self.need_setup = false
    end
  end
end
