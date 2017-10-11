class SensorRecordSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at
  has_one :sensor
end
