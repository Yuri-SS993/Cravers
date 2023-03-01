class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @post_user = User.find(current_user.id)
    @newpost = Post
    @users = User.all
  end

  def show
    @post_user = User.find(params[:id])
    @newpost = Post.new
    @posts = Post.where(user_id:params[:id])
    @post = Post.all.page(params[:page]).reverse_order.per(20)
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
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
  end
end
