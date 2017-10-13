class TankSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clusters
end
