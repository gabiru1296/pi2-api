class CreateLots < ActiveRecord::Migration[5.1]
  def change
    create_table :lots do |t|
      t.float :price
      t.date :validity
      t.date :buy_date
      t.float :quantity
      t.float :current_quantity
      t.date :end_date
      t.references :food

      t.timestamps
    end
  end
end
