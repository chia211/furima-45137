FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id {3} 
    cities      { '東京都' }
    house_number { '1-1' }
    building     { '東京ハイツ' }
    tell         {'09876543210'}
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
