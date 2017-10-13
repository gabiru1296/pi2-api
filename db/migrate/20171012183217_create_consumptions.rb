class CreateConsumptions < ActiveRecord::Migration[5.1]
  def change
    create_table :consumptions do |t|
      t.float :quantity
      t.references :lot, foreign_key: true
      t.references :feeder, foreign_key: true

      t.timestamps
    end
  end
end
