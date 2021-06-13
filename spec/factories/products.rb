FactoryBot.define do
  factory :product do
    name               {"apple"}
    explain            {Faker::Lorem.sentence}
    value              {"1000"}
    status_id          {"2"}
    prefecture_id      {"2"}
    delivery_charge_id {"2"}
    date_shipment_id   {"2"}
    category_id        {"2"}
    association :user 

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/calam.png'), filename: 'calam.png')
    end
  end
end
