class ClusterMetric < ApplicationRecord
  belongs_to :cluster

  before_validation :set_tca, on: :create

  def set_tca
    initial_weight = self.cluster.initial_weight
    current_estimated_weight = self.weight * self.cluster.current_total

    self.tca = self.cluster.food_weight_spent / (current_estimated_weight - initial_weight)
    self.cluster.current_tca = self.tca
    self.cluster.save
  end
end
