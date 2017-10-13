class AddCurrentTcaToCluster < ActiveRecord::Migration[5.1]
  def change
    add_column :clusters, :current_tca, :float
  end
end
