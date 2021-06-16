FactoryBot.define do
  factory :order_address do
    postal_code {"111-1111"}
    city {"奈良市"}
    address {"三条通り1-2"}
    building_name {"大仏ハイツ211"}
    phone_number {"11111111111"}
    prefecture_id {30}
    token {"tok_abcdefghijk00000000000000000"}
    

  end
end
