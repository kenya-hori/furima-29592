require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入情報の保存' do
    context '購入情報の保存ができる時' do
      it 'token、postal_code、city_name、address、building_name、phone_numberが存在し、prefecture_idが1以外であれば登録できる' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存ができる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '購入情報が保存できない時' do
      it 'tokenが空だと登録ができない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録ができない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが半角のハイフンを含んでも全角文字だと保存できないこと' do
        @order.postal_code = '１２３-４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが半角のハイフンを含んでも半角英字だと保存できない' do
        @order.postal_code = 'aaa-aaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefecture_idが1だと登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Sellect')
      end
      it 'city_nameが空だと登録ができない' do
        @order.city_name = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City name can't be blank")
      end
      it 'addressが空だと登録ができない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録ができない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角英字だと登録できない' do
        @order.phone_number = 'aaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Half-width number')
      end
      it 'phone_numberが全角文字だと登録できない' do
        @order.phone_number = '１２３４５'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Half-width number')
      end
    end
  end
end
