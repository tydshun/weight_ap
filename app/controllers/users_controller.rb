class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).per(6).order('created_at DESC')
  end

  def edit
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).per(6).order('created_at DESC')
  end

  def update
    @user = User.find(params[:id])
    if user_signed_in? && @user.id == current_user.id
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        redirect_to :edit
      end
    end
  end

  
  
  
  private
  def user_params
    params.require(:user).permit(:nickname ,:email, :password, :avatar, :profile, :height, :target_weight)
  end
end
