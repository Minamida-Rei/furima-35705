require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product, user_id: user.id)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe "商品の購入" do
    context "商品の購入ができる場合" do
      it "token, postal_code, city, address, phone_number, building_name, prefecture_idが存在し、product, userに紐づいていれば購入できる" do
        expect(@order_address).to be_valid
      end

      it "building_nameがなくても購入できる"do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context "商品の購入ができない場合" do
      it "tokenがなければ購入できない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end

      it "postal_codeがなければ購入できない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it "postal_codeにハイフンがないと購入できない" do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it "四文字目にハイフンがないと購入できない" do
        @order_address.postal_code = '1111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it "半角数字でないと購入できない" do
        @order_address.postal_code = '１１１-１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it "cityがないと購入できない" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it "addressがないと購入できない" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it "phone_numberがないと購入できない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it "phone_numberが全角数字だと購入できない" do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is not a number"
      end

      it "phone_numberに数字以外があると購入できない" do
        @order_address.phone_number = '11あ-１２３０-おおおお'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is not a number"
      end

      it "phone_numberが12桁以上だと購入できない" do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end

      it "prefecture_idがないと購入できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "user_idがないと購入できない" do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it "product_idがないと購入できない" do
        @order_address.product_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Product can't be blank"
      end
    end
  end
end
