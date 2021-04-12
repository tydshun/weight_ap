class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to "/tweets/#{@comment.tweet_id}"
  end
  def edit
    @comment = Comment.find(params[:id])
    @tweet = Tweet.find(params[:tweet_id])
    @comments = @tweet.comments.includes(:user).paginate(page: params[:page], per_page: 2)
  end
  def update
    @comment = Comment.find(params[:id])
    tweet = @comment.tweet_id
    if @comment.update(comment_params)
      redirect_to controller: :tweets, action: :show, id: tweet
    else
      redirect_to action: :edit
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    tweet = @comment.tweet_id
    @comment.destroy
    redirect_to controller: :tweets, action: :show, id: tweet
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
