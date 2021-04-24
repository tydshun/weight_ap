class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @user_data = Weight.where(user_id: current_user.id)
    @user = current_user
    if @user_data.present?
      @today_weight = @user_data.where(created_at: Time.zone.now.all_day).average(:weight_body)
      if @today_weight && @user.target_weight.present?
        @tt_weight = @today_weight - @user.target_weight 
      end
      @week_weight = @user_data.where(created_at: 1.week.ago.all_day).average(:weight_body)
      @month_weight = @user_data.where(created_at: 1.month.ago.all_day).average(:weight_body)
      if @today_weight && @user.height.present?
        @bmi = (@today_weight / (@user.height * @user.height) * 10000)
        @standard_weight = (@user.height * @user.height * 22.0 / 10000)
        @difference_weight = @today_weight - @standard_weight
        if @week_weight && @user.height.present?
          @bmi_week = (@today_weight / (@user.height * @user.height) * 10000.0)
        end
      end
    end
  end

  def month
    @weight = Weight.new
    @user_data = Weight.where(user_id: current_user.id)
    @user = current_user
    if @user_data.present?
      @week_weight = @user_data.where(created_at: 7.days.ago.beginning_of_day..Time.zone.now.end_of_day).average(:weight_body)
    end
    # 下記で30日前の週の平均体重から今日まで体重のデータを取得
    @month_weight = @user_data.where(created_at: 37.days.ago.beginning_of_day..31.days.ago.end_of_day).average(:weight_body)
    if @month_weight && @user.height.present? 
      @bmi = (@month_weight / (@user.height * @user.height) * 10000)
      @standard_weight = (@user.height * @user.height * 22.0 / 10000)
      @difference_weight = @month_weight - @standard_weight
      @bmi_month = (@month_weight / (@user.height * @user.height) * 10000.0)
    end
    # 30日前の週の平均と今週の平均の体重の比較
    if @month_weight && @week_weight.present?
      @wm_weight = (@week_weight - @month_weight)
    end
  end
  
  # 体重の作成
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
