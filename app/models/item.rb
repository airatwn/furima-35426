class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture 
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
  # validates :カラム名 numericality: { :only_integer true }
  validates :price, numericality: { in: 300..9999999 }
  end 
end

