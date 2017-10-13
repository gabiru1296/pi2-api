class Cluster < ApplicationRecord
  belongs_to :fish_type
  belongs_to :tank
  has_many :cluster_counters
  has_many :cluster_metrics
  has_many :consumptions

  before_create :set_current_total

  def food_weight_spent
    return self.consumptions.sum('quantity')
  end

  def money_spent
    return self.consumptions.sum('dose_value')
  end

  def transfer_in_quantity
    return counters_by_type(1)
  end

  def death_quantity
    return counters_by_type(2).abs
  end

  def transfer_out_quantity
    return counters_by_type(3)
  end

  def average_tca
    total_tca = self.cluster_metrics.sum('tca')
    return total_tca / self.cluster_metrics.count
  end

  private
  def set_current_total
    self.current_total = self.total
  end

  def counters_by_type(code)
    counter_type = ClusterCounterType.where(code: code);
    registers = self.cluster_counters.where(cluster_counter_type: counter_type)

    return registers.sum('quantity')
  end

end
