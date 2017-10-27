class AddSensorCodeToSensor < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :sensor_code, :integer
  end
end
