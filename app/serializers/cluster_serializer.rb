class ClusterSerializer < ActiveModel::Serializer
  attributes :id, :total, :is_done, :current_total, :end_date, :created_at, :initial_weight, :death_quantity, :money_spent, :food_weight_spent, :transfer_in_quantity, :transfer_out_quantity, :death_tax, :current_tca, :average_tca
  has_one :fish_type
  has_one :tank
  has_many :cluster_counters
  has_many :cluster_metrics


  def death_tax
    object.death_quantity.to_f.abs / (object.current_total + object.death_quantity.abs) * 100
  end
end
