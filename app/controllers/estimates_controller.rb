class EstimatesController < ApplicationController
  before_action :setup_estimate_product!, only: [:add_product, :update_product, :delete_product]
  before_action :authenticate_user!, only: [:index, :new, :edit, :update, :destroy]
  before_action :set_estimate, only: [:show, :destroy]

  def index
    @estimates = current_user.estimates.page(params[:page]).per(5)
    # @products = Product.all
  end

  def new
    @estimate = Estimate.new
    @products = Product.all
    # #検索オブジェクト
    # @search = Product.ransack(params[:q])
    # # 検索結果
    # @products = @search.result
  end

  def create
    @estimate = current_user.estimates.build(estimate_params)

    if @estimate.save
      # 一覧画面へ遷移して"見積書を作成しました！"とメッセージを表示します。
      redirect_to estimates_path, notice: "見積書を作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
      # end
    end
  end

  def show
    # @estimate = Estimate.find(params[:id])
    # @products = @estimate.products
    # @products = Product.all
    @estimate = current_user.estimates.find(params[:id])
    @reasons = @estimate.reasons
    @reason = @estimate.reasons.build
  end

  def edit
    @estimate = current_user.estimates.find(params[:id])
  end

  def update
    @estimate = current_user.estimates.find(params[:id])
    if @estimate.update(estimate_params)
      redirect_to estimates_path, notice: "見積書編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @estimate.destroy
    redirect_to estimates_path, notice:"見積書を削除しました！"
  end

  # def add_product
  #   if @estimate_product.blank?
  #     @estimate_product = current_estimate.estimate_products.build(product_id: params[:product_id])
  #   end
  #
  #   @estimate_product.quantity += params[:quantity].to_i
  #   @estimate_product.save
  #   redirect_to current_estimate
  # end
  #
  #
  # # カート詳細画面から、「更新」を押した時のアクション
  # def update_product
  #   @estimate_product.update(quantity: params[:quantity].to_i)
  #   redirect_to current_estimate
  # end
  #
  # # カート詳細画面から、「削除」を押した時のアクション
  # def delete_product
  #   @estimate_product.destroy
  #   redirect_to current_estimate
  # end


  private

  def estimate_params
    params.require(:estimate).permit(:total_price, :discount, :customer_name, :deadline,{ product_ids: [] })
  end

  def set_estimate
    @estimate = Estimate.find(params[:id])
  end

  # def params_estimate_products
  #   params.require(:estimate).permit(
  #     :total_price, :discount, :deadline, :user_id, products_attributes:[
  #       :name, :stock, :unit_price, :id
  #     ]
  #   )
  # end

  # def setup_estimate_product!
  #   @estimate_product = current_estimate.estimate_products.find_by(product_id: params[:product_id])
  # end



end
