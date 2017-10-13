class Lot < ApplicationRecord
  belongs_to :food
  has_many :consumptions
  has_many :feeders, through: :consumptions

  before_create :set_current_quantity

  def set_current_quantity
    self.current_quantity = self.quantity
  end
end
