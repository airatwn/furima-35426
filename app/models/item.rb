class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
  validates :category_id, :price, :condition, :shipping_charge, :prefecture, :days_to_ship, numericality: { other_than: 1 }
  end
  with_options presence: true do
  validates numericality: { :only_integer true }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture 
  belongs_to :days_to_ship
end
