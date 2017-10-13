class Consumption < ApplicationRecord
  belongs_to :lot
  belongs_to :feeder
  belongs_to :cluster

  after_save :update_lot_quantity
  before_validation :set_cluster, on: :create
  before_validation :set_dose_value, on: :create

  def update_lot_quantity
    self.lot.current_quantity -= self.quantity
    self.lot.save
  end

  def set_dose_value
    price_per_kilo = self.lot.quantity / self.lot.price
    self.dose_value= price_per_kilo * self.quantity
  end

  def set_cluster
    self.cluster = self.feeder.tank.current_cluster
  end
end
