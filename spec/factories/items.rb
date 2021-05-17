FactoryBot.define do
  factory :item do
    item_name { 'スケボー' }
    category_id           { 2 }
    price                 { 300 }
    condition_id          { 2 }
    shipping_charge_id    { 2 }
    prefecture_id         { 2 }
    days_to_ship_id       { 2 }
    item_text             { 'これはスケボーです。' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
