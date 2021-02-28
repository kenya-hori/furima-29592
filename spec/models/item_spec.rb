require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '新規登録できる時' do
      it 'image、name、text、priceが存在し、category_id、condition_id、delivery_fee_burden_id、prefecture_id、day_to_ship_idが1以外であれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300から9999999の間であれば登録できる' do
        @item.price = '12345'
        expect(@item).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it 'textが空だと登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Text can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceが300より小さいと登録できない' do
        @item.price = '50'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Out of setting range")
      end
      it 'priceが10000000以上だと登録できない' do
        @item.price = '5010000000'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Out of setting range")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = 'あbc'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Half-width number")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category Sellect")
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition Sellect")
      end
      it 'delivery_fee_burden_idが1だと登録できない' do
        @item.delivery_fee_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery fee burden Sellect")
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture Sellect")
      end
      it 'day_to_ship_idが1だと登録できない' do
        @item.day_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day to ship Sellect")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
