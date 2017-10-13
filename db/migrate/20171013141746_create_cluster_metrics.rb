class CreateClusterMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :cluster_metrics do |t|
      t.float :weight
      t.float :length
      t.float :tca
      t.references :cluster, foreign_key: true

      t.timestamps
    end
  end
end
