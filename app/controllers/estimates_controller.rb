class EstimatesController < ApplicationController
  before_action :setup_estimate_product!, only: [:add_product, :update_product, :delete_product]
  before_action :authenticate_user!, only: [:index, :new, :edit, :update, :destroy]
  before_action :set_estimate, only: [:edit, :update, :destroy]

  def index
    @estimates = current_user.estimates.page(params[:page]).per(5)
    @customers
  end

  def new
    @estimate = Estimate.new
    @products = Product.all

    @estimate.estimate_products.build

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
    @estimate = current_user.estimates.find(params[:id])
    @products = @estimate.products
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


  private

  def estimate_params
    params.require(:estimate).permit(:total_price, :discount, :quantity, :customer_id,
                                     :deadline,{ product_ids: [] }, :product_name, :quantity,
                                     [estimate_products_attributes:[:id, :estimate_id, :product_id, :quantity, :_destroy]]
                                     ).merge(user_id: current_user.id)
  end

  def total(unit_price, quantity)
    unit_price.find * @estimate_product.quantity
  end

  def set_estimate
    @estimate = Estimate.find(params[:id])
  end
end
