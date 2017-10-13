class ClusterCounterSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :cluster
  has_one :cluster_counter_type
end
