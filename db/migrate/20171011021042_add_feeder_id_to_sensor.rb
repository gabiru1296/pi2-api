class AddFeederIdToSensor < ActiveRecord::Migration[5.1]
  def change
    add_reference :sensors, :feeder, foreign_key: true
  end
end
