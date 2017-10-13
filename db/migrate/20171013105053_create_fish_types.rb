class CreateFishTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :fish_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
