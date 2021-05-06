class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :category, :price, :condition, :shipping_charge, :prefecture, :days_to_ship, numericality: { other_than: 1 }
end
