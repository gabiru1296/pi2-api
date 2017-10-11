class CreateFeeders < ActiveRecord::Migration[5.1]
  def change
    create_table :feeders do |t|
      t.string :nickname
      t.references :tank, foreign_key: true

      t.timestamps
    end
  end
end
