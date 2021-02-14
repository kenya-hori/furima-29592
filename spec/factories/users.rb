FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kana_first_name       {'ゲッコウ'}
    kana_family_name      {'ラン'}
    kanji_first_name      {'激昂'}
    kanji_family_name     {'蘭'}
    birthday              {'1981-01-27'}
  end
end