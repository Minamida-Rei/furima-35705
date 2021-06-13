class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
  before_action :product_find, only: [:sohw, :edit, :update]
  before_action :current_user_check, only: [:edit, :update]
  
  def index
    @product = Product.includes(:user).order("created_at DESC")
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

  private

  def product_params
    params.require(:product).permit(:name, :explain, :category_id, :prefecture_id, :status_id, :date_shipment_id, :delivery_charge_id, :value, :image).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def current_user_check
    unless current_user.id == @product.user.id
      redirect_to action: :index
    end
  end

end
