require 'date'

class SensorRecord < ApplicationRecord
  belongs_to :sensor

  def self.created(days, a_sensor)
    return SensorRecord.where(created_at: to_timerange(days), sensor: a_sensor)
  end

  private

  def self.to_timerange(days)
    dts = Time.now
    dte = dts - (24 * 60 * 60) * days
    return (dte...dts)
  end
end
