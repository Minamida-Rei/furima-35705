class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def sold_check
    if @product.order
      redirect_to root_path
    end
  end
end
