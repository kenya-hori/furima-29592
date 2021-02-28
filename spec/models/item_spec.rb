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
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
      it '' do
        
      end
    end
  end
end
