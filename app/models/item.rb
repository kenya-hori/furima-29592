class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day_to_ship
  belongs_to :delivery_fee_burden
  belongs_to :prefecture

end
