class AddFeederWeightToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :weight, :integer
  end
end
