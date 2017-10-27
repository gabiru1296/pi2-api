class CreateMigrations < ActiveRecord::Migration[5.1]
  def change
    create_table :migrations do |t|
      t.string :add_batery_level_to_feeder
      t.integer :betery_level

      t.timestamps
    end
  end
end
