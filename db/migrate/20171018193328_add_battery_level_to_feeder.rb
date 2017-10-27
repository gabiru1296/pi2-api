class AddBatteryLevelToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :battery_level, :integer
  end
end
