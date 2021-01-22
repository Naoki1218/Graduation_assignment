class ProductsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item]

  def index
    @products = Product.all
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  # def create
  #   @product = current_user.products.build(product_params)
  #
  #   if @product.save
  #     # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
  #     redirect_to new_estimate_path, notice: "製品を追加しました！"
  #   else
  #     # 入力フォームを再描画します。
  #     render :new
  #     # end
  #   end
  # end

  # def add_item
  #   if @choose_item.blank?
  #     @choose_item = current_product.choose_items.build(product_id: params[:product_id])
  #   end
  #
  #   @choose_item.quantity += params[:quantity].to_i
  #   @choose_item.save
  #   redirect_to new_estimate_path
  # end
  #
  # def update_item
  #   @choose_item.update(quantity: params[:quantity].to_i)
  #   redirect_to current_product
  # end

  private

  def product_params
    params.require(:product).permit(:name, :unit_price, :availability)
  end


  # def setup_choose_item!
  #   @choose_item = current_product.choose_items.find_by(product_id: params[:product_id])
  # end
end
