class AddRegisterDateToSensorRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :sensor_records, :register_date, :datetime
  end
end
