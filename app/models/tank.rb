class Tank < ApplicationRecord
  has_one :feeder
  has_many :clusters

  def current_cluster
    Cluster.where(tank: self, is_done: false).take
  end
end
