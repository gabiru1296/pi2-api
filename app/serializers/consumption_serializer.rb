class ConsumptionSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :created_at, :dose_value
  has_one :lot
  has_one :feeder
end
