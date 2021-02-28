class ProductsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item]

  def index
    @products = Product.all
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end


  private

  def product_params
    params.require(:product).permit(:name, :unit_price, :availability)
  end
end
