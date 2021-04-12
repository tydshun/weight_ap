class UsersController < ApplicationController
  def show
    @user = current_user
    @tweets = Tweet.page(params[:page]).per(6).order('created_at DESC')
  end
end
