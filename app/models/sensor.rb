class Sensor < ApplicationRecord
  belongs_to :feeder
  has_many :sensor_record, dependent: :destroy
  has_many :sensor_errors, dependent: :destroy
end
