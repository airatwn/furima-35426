FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'111aaa'}
    password_confirmation {password}
    first_name            {'小川'}
    first_name_kana       {'オガワ'}
    family_name           {'祐汰'}
    family_name_kana      {'ユウタ'}
    birthday              {'2021-05-03'}
  end

end