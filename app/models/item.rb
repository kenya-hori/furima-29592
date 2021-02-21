class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day_to_ship
  belongs_to :delivery_fee_burden
  belongs_to :prefecture
  has_one_attached :image

  with_options presence: true do
    validates  :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ , message: "Half-width number"}, numericality: { greater_than_or_equal_to: 300, less_than: 10000000, message: "Out of setting range"}
  end

  validates :category_id, :condition_id, :delivery_fee_burden_id, :prefecture_id, :day_to_ship_id, numericality: { other_than: 1 ,message: "Sellect"}
end
