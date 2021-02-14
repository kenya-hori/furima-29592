require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname、email、password、password_confirmation、kana_first_name、kana_family_name、kanji_first_name、kanji_family_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数字混合の6文字以上であれば登録できる' do
        @user.password = 'abcde6'
        @user.password_confirmation = 'abcde6'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationがないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'kana_first_nameが空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana first name can't be blank")
      end
      it 'kana_first_nameがカタカナでないと登録できない' do
        @user.kana_first_name = 'abc345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana first name Full-width katakana characters")
      end

      it 'kana_family_nameが空だと登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana family name can't be blank")
      end

      it 'kana_family_nameがカタカナでないと登録できない' do
        @user.kana_family_name = 'abc345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana family name Full-width katakana characters")
      end

      it 'kanji_first_nameが空だと登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kanji first name can't be blank")
      end

      it 'kanji_first_nameが英数字だと登録できない' do
        @user.kanji_first_name = 'abc345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kanji first name Full-width characters")
      end

      it 'kanji_family_nameが空だと登録できない' do
        @user.kanji_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kanji family name can't be blank")
      end

      it 'kanji_family_nameが英数字だと登録できない' do
        @user.kanji_family_name = 'abc345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kanji family name Full-width characters")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abcd5'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが6文字以上でも英字だけだと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Include both letters and numbers")
      end

      it 'passwordが6文字以上でも数字だけだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Include both letters and numbers")
      end

      it '重複したemailが存在する場合では登録ができないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it 'emailに@がないと登録ができないこと' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end
