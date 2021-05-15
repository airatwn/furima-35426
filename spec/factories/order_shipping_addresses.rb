FactoryBot.define do
  factory :order_shipping_address do
    portal_code              { '666-6666' }
    prefecture_id            { '47'}
    address1                 { '札幌市'}
    address2                 { '旭区1-1-1'}
    building_name            { 'test'}
    phone_number             { '08011112222'}
    # token                    { 'tok_aaaaaaaaaa666666'}
  end
end
