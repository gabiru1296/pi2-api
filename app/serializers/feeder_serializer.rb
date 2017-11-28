class FeederSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :food_level, :battery_level, :need_setup, :network_code
  has_one :tank
  has_many :sensors
  has_many :consumptions
  has_many :feeder_clocks
end
