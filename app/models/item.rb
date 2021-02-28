class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_burden
  belongs_to :prefecture
  belongs_to :day_to_ship

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :text,presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, message: "Half-width number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000, message: "Out of setting range" }
  validates :category_id, :condition_id, :delivery_fee_burden_id, :prefecture_id, :day_to_ship_id, numericality: { other_than: 1 ,message: "Sellect"}
end
