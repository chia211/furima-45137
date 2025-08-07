FactoryBot.define do
  factory :item do
    name             { '商品名サンプル' }
    description      { 'これはテスト用の説明文です。1000文字以内で記述。'}
    category_id      { 2 }
    quality_id       { 2 }
    postage_id       { 2 }
    prefecture_id    { 2 }
    shipping_day_id  { 2 }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
