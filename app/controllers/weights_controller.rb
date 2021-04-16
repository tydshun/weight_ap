class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @today_weight = Weight.group_by_day(:created_at).average(:weight_body)
    
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
