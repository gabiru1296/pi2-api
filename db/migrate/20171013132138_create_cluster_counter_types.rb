class CreateClusterCounterTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :cluster_counter_types do |t|
      t.integer :code
      t.string :description

      t.timestamps
    end
  end
end
