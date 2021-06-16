require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user_id: user.id)
  end

  describe "商品の出品" do
    context "商品の出品ができるとき" do
      it "name, explain, value, status_id, prefecture_id, delivery_charge_id, date_shipment_id, category_id, imegeに値が存在していれば出品ができる" do
        expect(@product).to be_valid
      end
    end

    context "商品の出品ができないとき" do
      it "nameが空白だと出品できない" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
  
      it "explainが空白だと出品できない" do
        @product.explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Explain can't be blank"
      end

      it "valueが空白だと出品できない" do
        @product.value = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Value can't be blank"
      end

      it "status_idが空白だと出品できない" do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Status must be other than 1"
      end

      it "prefecture_idが空白だと出品できない" do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it "delivery_charge_idが空白だと出品できない" do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery charge must be other than 1"
      end

      it "date_shipment_idが空白だと出品できない" do
        @product.date_shipment_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Date shipment must be other than 1"
      end

      it "category_idが空白だと出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Category must be other than 1"
      end

      it "userに紐づいていないと出品できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "User must exist"
      end

      it "imageが空白だと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end

      it "valueが299円以下だと出品できない" do
        @product.value = 100
        @product.valid?
        expect(@product.errors.full_messages).to include "Value must be greater than or equal to 300"
      end

      it "valueが10000000円以上だと出品できない" do
        @product.value = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include "Value must be less than or equal to 9999999"
      end

      it "valueは半角数字のみ保存可能" do
        @product.value = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include "Value is not a number"
      end
    end
  end
end
