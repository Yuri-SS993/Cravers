class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:likes]
  
  def index
    @user = User.find(current_user.id)
    @post_user = User.find(current_user.id)
    @newpost = Post.new
    @users = User.all
  end

  def show
    @post_user = User.find(params[:id])
    @newpost = Post.new
    @user = current_user
    @posts = Post.where(user_id:params[:id])
    @postpage = Post.all.page(params[:page]).reverse_order.per(20)
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have successfully updated your profile."
    else
      render :edit
    end
  end
  
  def likes
    @post_user = User.find(current_user.id)
    @newpost = Post.new
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
    @postpage = Post.all.page(params[:page]).reverse_order.per(20)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
