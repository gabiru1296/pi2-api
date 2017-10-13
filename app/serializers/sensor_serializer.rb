class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :scale, :is_working, :fail_registration
  has_many :sensor_record
  has_many :sensor_errors
  belongs_to :feeder
end
