class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @user = User.find(current_user.id)
    @post_user = current_user
    @newpost = Post.new
    @posts = Post.all
    @postpage = Post.all.page(params[:page]).reverse_order.per(20)
  end
  
  def create
    @user = User.find(current_user.id)
    @newpost = Post.new(post_params)
    @newpost.user_id = current_user.id
    if @newpost.save
      redirect_to post_path(@newpost), notice: "You have successfully posted the new item."
    else
      @user = User.find(current_user.id)
      @post_user = current_user
      @posts = Post.all
      @postpage = Post.all.page(params[:page]).reverse_order.per(20)
      render :index
    end
  end
  
  def show
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @post_user = @post.user
    @newpost = Post.new
  end

  def edit
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
  end
  
  def update
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have successfully updated the post."
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:image, :title, :body)
  end
  
  def correct_user
    @post = Post.find(params[:id])
      redirect_to posts_path unless current_user == @post.user
  end
end
