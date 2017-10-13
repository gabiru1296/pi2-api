class CreateClusters < ActiveRecord::Migration[5.1]
  def change
    create_table :clusters do |t|
      t.integer :total
      t.boolean :is_done
      t.integer :current_total
      t.references :fish_type, foreign_key: true
      t.references :tank, foreign_key: true

      t.timestamps
    end
  end
end
