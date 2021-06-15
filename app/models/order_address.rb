class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :phone_number, :building_name, :prefecture_id, :order_id, :user_id, :token, :product_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number,  numericality: {only_integer: true}
    validates :user_id
    validates :product_id
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(
      phone_number: phone_number,
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      address: address, 
      building_name: building_name, 
      order_id: order.id
    )
  end
end