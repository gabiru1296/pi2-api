class CreateClusterCounters < ActiveRecord::Migration[5.1]
  def change
    create_table :cluster_counters do |t|
      t.integer :quantity
      t.references :cluster, foreign_key: true
      t.references :cluster_counter_type, foreign_key: true

      t.timestamps
    end
  end
end
