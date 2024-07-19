FactoryBot.define do
  factory :user do
    nickname        { Faker::Name.name }
    email           { Faker::Internet.unique.email }
    password        { Faker::Internet.password(min_length: 6, max_length: 128, mix_case: true, special_characters: false) }
    password_confirmation { password }
    first_name      { '山田' } # 固定の全角漢字名（例として）
    last_name       { '太郎' } # 固定の全角漢字姓（例として）
    first_name_kana { 'ヤマダ' } # 固定の全角カタカナ名（例として）
    last_name_kana  { 'タロウ' } # 固定の全角カタカナ姓（例として）
    birth_day       { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
