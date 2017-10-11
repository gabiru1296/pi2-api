class FeederSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :nivel
  has_one :tank
end
