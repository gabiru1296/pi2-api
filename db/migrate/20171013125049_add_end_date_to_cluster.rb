class AddEndDateToCluster < ActiveRecord::Migration[5.1]
  def change
    add_column :clusters, :end_date, :date
  end
end
