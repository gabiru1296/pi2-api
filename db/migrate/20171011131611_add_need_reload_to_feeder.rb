class AddNeedReloadToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :need_reload, :boolean, :null => false, :default => true
  end
end
