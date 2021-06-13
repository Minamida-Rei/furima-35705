class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explain, :category_id, :prefecture_id, :status_id, :date_shipment_id, :delivery_charge_id, :value, :image).merge(user_id: current_user.id)
  end
end
