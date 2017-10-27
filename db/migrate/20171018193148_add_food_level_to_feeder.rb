class AddFoodLevelToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :food_level, :integer
  end
end
