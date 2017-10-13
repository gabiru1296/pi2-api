class AddDoseValueToConsumption < ActiveRecord::Migration[5.1]
  def change
    add_column :consumptions, :dose_value, :float
  end
end
