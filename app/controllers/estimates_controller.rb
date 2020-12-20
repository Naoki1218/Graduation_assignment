class EstimatesController < ApplicationController
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @estimates = Estimate.all
  end

  def new
    @estimate = Estimate.new

    # 検索オブジェクト
    @search = Product.ransack(params[:q])
    # 検索結果
    @products = @search.result
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
  end

  def edit
    @estimate = current_user.estimates.find(params[:id])
  end

  def update
    @estimate = current_user.estimates.find(params[:id])
    if @estimate.update(estimate_params)
      redirect_to estimates_path, notice: "見積書を編集しました！"
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
    params.require(:estimate).permit(:total_price, :discount)
  end

  def set_estimate
    @estimate = current_user.estimates.find(params[:id])
  end

end
