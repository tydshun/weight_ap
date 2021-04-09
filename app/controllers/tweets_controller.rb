class TweetsController < ApplicationController
    before_action :set_tweet, only: [:show, :edit]
  
    def index
      @tweets = Tweet.all
      @tweet = Tweet.new
    end
  
    def new
      @tweet = Tweet.new
    end
  
    def create
      @tweet = Tweet.new(tweet_params)
      @tweet.save
    end
  
    def show
      @comment = Comment.new
      @comments = @tweet.comments.includes(:user)
      
    end
  
    def edit
      unless user_signed_in? && current_user.id == @tweet.user.id
        redirect_to action: :index
      end
    end
  
    def update
      @tweet = Tweet.find(params[:id])
      if @tweet.update(tweet_params)
        redirect_to action: :show
      else
        render :edit
      end
    end
  
    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy
    end
  
    private
    def tweet_params
      params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id)
    end
  
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
