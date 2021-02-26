class ReasonsController < ApplicationController
  before_action :set_estimate, only: [:create, :edit, :update]
  def create
   @estimate = Estimate.find(params[:estimate_id])
   @reason = @estimate.reasons.build(reason_params)
   respond_to do |format|
     if @reason.save
       format.js { render :index }
     else
       format.html { redirect_to estimate_path(@estimate), notice: '理由を記入してください！' }
     end
   end
 end

  def edit
    @reason = @estimate.reasons.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = '理由の編集中'
      format.js { render :edit }
    end
  end

 def update
    @reason = @estimate.reasons.find(params[:id])
      respond_to do |format|
        if @reason.update(reason_params)
          flash.now[:notice] = '理由が編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = '理由の編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @reason = Reason.find(params[:id])
    @reason.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

 private
 # ストロングパラメーター
 def reason_params
   params.require(:reason).permit(:estimate_id, :content, :user_id)
 end

 def set_estimate
    @estimate = Estimate.find(params[:estimate_id])
  end
end
