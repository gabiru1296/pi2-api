class CreateFeederClocks < ActiveRecord::Migration[5.1]
  def change
    create_table :feeder_clocks do |t|
      t.integer :hour
      t.integer :minute
      t.references :feeder, foreign_key: true

      t.timestamps
    end
  end
end
