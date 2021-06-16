class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :product_find, only: [:show, :edit, :update, :destroy]
  before_action :sold_current_user_check, only: [:edit, :update, :destroy]

  def index
    @product = Product.includes(:user).order("created_at DESC")
    @order = Order.all
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

  def show
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  private

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :explain, :category_id, :prefecture_id, :status_id, :date_shipment_id, :delivery_charge_id, :value, :image).merge(user_id: current_user.id)
  end

  def sold_current_user_check
    if @product.order.present? || current_user.id != @product.user.id
      redirect_to root_path
    end
  end
end
