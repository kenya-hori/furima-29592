class Order
  include ActiveModel::Model # form_withメソッドに対応する機能とバリデーションを行う機能
  attr_accessor :postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Sellect' }
    validates :city_name
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: 'Half-width number' }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
  end

  def save # それぞれのテーブルへのデータ保存のための処理
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id) # user.idはログイン時のid,item.idは購入する商品のid
    BuyerInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id) # フォームから送られてきた購入者情報の保存,item.idは購入する商品のid
  end
end
