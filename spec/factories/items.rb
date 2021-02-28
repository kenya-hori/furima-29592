FactoryBot.define do
  factory :item do
    name                        {Faker::Lorem.characters(number: 40)}
    text                        {Faker::Lorem.characters(number: 1000)}
    price                       {Faker::Number.between(from: 300, to: 9999999)}
    category_id                 {Faker::Number.between(from: 2,to: 11)}
    condition_id                {Faker::Number.between(from: 2,to: 7)}
    delivery_fee_burden_id      {Faker::Number.between(from: 2,to: 3)}
    prefecture_id               {Faker::Number.between(from: 2,to: 48)}
    day_to_ship_id              {Faker::Number.between(from: 2,to: 4)}
    association                 :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
