class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :product_pick, only: [:index, :create]
  before_action :sold_user_check, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.value,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def product_pick
    @product = Product.find(params[:item_id])
  end

  def sold_user_check
    if @product.order.present? || current_user.id == @product.user.id
      redirect_to root_path
    end
  end
end
