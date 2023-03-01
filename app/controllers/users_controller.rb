class UsersController < ApplicationController
  def index
    @users = User.all
    @post_user = User.find(current_user.id)
    @newpost = Post
  end

  def show
  end

  def edit
  end
end
