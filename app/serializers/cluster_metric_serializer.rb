class ClusterMetricSerializer < ActiveModel::Serializer
  attributes :id, :weight, :length, :tca
  has_one :cluster
end
