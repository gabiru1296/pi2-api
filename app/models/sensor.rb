class Sensor < ApplicationRecord
  belongs_to :feeder
  has_many :sensor_record
end
