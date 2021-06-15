class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explain
    validates :image
  end
  
  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :category_id
    validates :prefecture_id
    validates :date_shipment_id
    validates :delivery_charge_id
  end

  validates :value, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :prefecture
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :date_shipment
end
