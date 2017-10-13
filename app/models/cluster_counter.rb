class ClusterCounter < ApplicationRecord
  belongs_to :cluster
  belongs_to :cluster_counter_type

  after_save :update_cluster_quantity
  before_save :check_value

  def update_cluster_quantity
    self.cluster.current_total += self.quantity
    self.cluster.save
  end

  def check_value
    couterType = self.cluster_counter_type.code

    if couterType == 1
      self.quantity = self.quantity.abs
    elsif couterType == 2
      self.quantity = self.quantity.abs * -1
    elsif couterType == 3
      self.quantity = self.quantity.abs * -1
    end
  end
end


# ClusterCounterType.create([
#     {
#       code: 1,
#       description: 'Adição vindo de outro tanque'
#     },
#     {
#       code: 2,
#       description: 'Peixes mortos'
#     },
#     {
#       code: 3,
#       description: 'Peixes enviados para outro tanque'
#     }
# ])
