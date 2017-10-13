class FeederSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :nivel, :need_setup, :network_code
  has_one :tank
  has_many :sensors
  has_many :consumptions
end
