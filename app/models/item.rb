class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
  validates :category_id, :condition, :shipping_charge, :prefecture, :days_to_ship, numericality: { other_than: 1 }
  end
  with_options presence: true do
  # validates :カラム名 numericality: { :only_integer true }
  with_options presence: true do
  validates :price, numericality: { in: 300..9999999 }
  end
 
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture 
  belongs_to :days_to_ship
end
end
