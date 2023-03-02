class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :post_params, only: [:create, :destroy]

    def create
        @post = Post.find(params[:post_id])
        @like = current_user.likes.new(post_id: @post.id)
        @like.save
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @like = current_user.likes.find_by(post_id: @post.id)
        @like.destroy
        redirect_to posts_path
    end

    private
    def post_params
        @post = Post.find(params[:post_id])
    end
end
