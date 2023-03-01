class PostsController < ApplicationController
  def index
    @post_user = current_user
    @newpost = Post.new
    @posts = Post.all
    @post = Post.all.page(params[:page]).reverse_order.per(20)
  end

  def show
    @post = Post.find(params[:id])
    @post_user = @post.user
    @newpost = Post.new
  end
  
  def create
    @newpost = Post.new(post_params)
    @newpost.user_id = current_user.id
    @newpost.save
    redirect_to post_path(@newpost)
  end

  def edit
  end
  
  private
  def post_params
    params.require(:post).permit(:image, :title, :body)
  end
end
