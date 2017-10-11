class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :thickness
  has_many :lots
end
