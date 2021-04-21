class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    # @today_weight = Weight.average(:weight_body).round(2)
    @today_weight = Weight.where(created_at: Time.zone.now.all_day).average(:weight_body)
    @week_weight = Weight.where(created_at: 1.week.ago.all_day).average(:weight_body)
    @month_weight = Weight.where(created_at: 1.month.ago.all_day).average(:weight_body)
    # @bmi = (@today_weight / (height2 ** 2))
    # @height1 = 
    @user = current_user
  end
  
  def create
    @weight = Weight.new(weight_params)
    @weight.save
    redirect_to weights_path
  end

  private

  def weight_params
    params.require(:weight).permit(:weight_body).merge(user_id: current_user.id)
  end
end
