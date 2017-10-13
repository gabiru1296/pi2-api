class LotSerializer < ActiveModel::Serializer
  attributes :id, :price, :validity, :buy_date, :quantity, :current_quantity, :end_date
  belongs_to :food
  has_many :consumptions
end
