require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '新規登録できる時' do
      it 'image、name、text、price、が存在し、category_id、condition_id、delivery_fee_burden_id、prefecture_id、day_to_ship_idが１以外であれば登録できる' do
        
      end
      it 'priceが300から9999999の間であれば登録できる' do
        
      end
    end

    context '新規登録できない時' do
      it 'imageが空だと登録できない' do
        
      end
      it 'nameが空だと登録できない' do
        
      end
      it 'textが空だと登録できない' do
        
      end
      it 'priceが空だと登録できない' do
        
      end
      it 'priceが300より小さいと登録できない' do
        
      end
      it 'priceが10000000以上だと登録できない' do
        
      end
      it 'category_idが1だと登録できない' do
        
      end
      it 'condition_idが1だと登録できない' do
        
      end
      it 'delivery_fee_burden_idが1だと登録できない' do
        
      end
      it 'prefecture_idが1だと登録できない' do
        
      end
      it 'day_to_ship_idが1だと登録できない' do
        
      end
    end
  end
end
