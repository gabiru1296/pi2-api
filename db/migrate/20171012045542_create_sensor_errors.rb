class CreateSensorErrors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensor_errors do |t|
      t.integer :error
      t.references :sensor, foreign_key: true

      t.timestamps
    end
  end
end
