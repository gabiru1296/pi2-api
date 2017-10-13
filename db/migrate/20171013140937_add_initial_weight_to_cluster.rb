class AddInitialWeightToCluster < ActiveRecord::Migration[5.1]
  def change
    add_column :clusters, :initial_weight, :float
  end
end
