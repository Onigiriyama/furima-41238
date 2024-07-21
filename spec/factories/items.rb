FactoryBot.define do
  factory :item do
    name              { Faker::Commerce.product_name }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    comment           { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    shipping_payer_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id   { Faker::Number.between(from: 2, to: 4) }
    image             { Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_image.png'), 'image/png') }
    association :user
  end
end
