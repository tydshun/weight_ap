class BlogsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @blogs = current_user.blogs
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    if @blog.user == current_user
      render "show"
    else
      redirect_to blogs_path
    end

  end

  def create
    @blog = Blog.new(blog_parameter)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
    
    
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.user == current_user
      render "edit"
    else
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def search
    @blog = current_user.blogs
    @blogs = @blog.search(params[:search]).includes(:user).order("created_at DESC").paginate(page: params[:page], per_page: 4)
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end