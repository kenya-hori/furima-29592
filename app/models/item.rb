class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day_to_ship
  belongs_to :delivery_fee_burden
  belongs_to :prefecture

  validates :name, :text, presence: true
  validates :category_id, :condition_id, :day_to_ship_id, :delivery_fee_burden_id, :prefecture_id, numericality: { ohther_than: 1 }
end
