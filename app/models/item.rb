class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_burden
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'Out of setting range' }
  validates :category_id, :condition_id, :delivery_fee_burden_id, :prefecture_id, :day_to_ship_id,
            numericality: { other_than: 1, message: 'Sellect' }
end
