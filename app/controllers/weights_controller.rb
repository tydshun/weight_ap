class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @user_data = Weight.where(user_id: current_user.id)
    @user = current_user
    if @user_data.present?
      @today_weight = @user_data.where(created_at: Time.zone.now.all_day).average(:weight_body).round(2)
      @week_weight = @user_data.where(created_at: 1.week.ago.all_day).average(:weight_body)
      @month_weight = @user_data.where(created_at: 1.month.ago.all_day).average(:weight_body)
      @bmi = (@today_weight / (@user.height * @user.height) * 10000)
      @standard_weight = (@user.height * @user.height * 22.0 / 10000)
      @difference_weight = @today_weight - @standard_weight
      if @week_weight && @user.height.present?
        @bmi_week = (@week_weight / (@user.height * @user.height) * 10000.0)
      end
    end
  end
  
  def create
    @user = current_user
    @weight = Weight.new(weight_params)
    @weight.save
    redirect_to weights_path
  end

  private

  def weight_params
    params.require(:weight).permit(:weight_body, :height).merge(user_id: current_user.id)
  end
end
