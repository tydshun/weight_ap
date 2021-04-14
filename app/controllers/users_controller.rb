class UsersController < ApplicationController
  def show
    @user = current_user
    @tweets = current_user.tweets.page(params[:page]).per(6).order('created_at DESC')
  end

  def edit
    @user = current_user
    @tweets = current_user.tweets.page(params[:page]).per(6).order('created_at DESC')
  end
end
