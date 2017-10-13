class AddClusterReferenceToConsumpiton < ActiveRecord::Migration[5.1]
  def change
    add_reference :consumptions, :cluster, foreign_key: true
  end
end
