class AddNetworkCodeToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :network_code, :integer
  end
end
