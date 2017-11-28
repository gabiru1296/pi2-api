class AddQuatityToFeederClocks < ActiveRecord::Migration[5.1]
  def change
    add_column :feeder_clocks, :quatity, :integer
  end
end
