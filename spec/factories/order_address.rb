FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { 'テスト市' }
    address_line  { 'テスト町1-1-1' }
    building      { 'テストビル101' }
    phone_number  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
