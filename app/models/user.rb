class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
  with_options presence: true do
    validates :nickname, :birthday
    validates :kanji_family_name, :kanji_first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters"}
    validates :kana_family_name, :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  end
  has_many :items
end
