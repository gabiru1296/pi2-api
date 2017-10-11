class AddNivelToFeeder < ActiveRecord::Migration[5.1]
  def change
    add_column :feeders, :nivel, :string, :null => false, :default => 'low'
  end
end
