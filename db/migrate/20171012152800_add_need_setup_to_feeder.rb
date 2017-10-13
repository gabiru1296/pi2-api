class AddNeedSetupToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :need_setup, :boolean, :null => false, :default => true
  end
end
