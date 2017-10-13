class SensorErrorSerializer < ActiveModel::Serializer
  attributes :id, :error, :description, :created_at
  belongs_to :sensor
end
