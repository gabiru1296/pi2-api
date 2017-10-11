class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :description
      t.string :scale
      t.boolean :is_working
      t.date :fail_registration

      t.timestamps
    end
  end
end
