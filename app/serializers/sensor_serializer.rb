class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :scale, :is_working, :fail_registration
  has_many :sensor_record
  belongs_to :feeder
end
