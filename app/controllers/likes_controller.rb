class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :post_params, only: [:create, :destroy]

    def create
        Like.create(user_id: current_user.id, post_id: @post.id)
        redirect_to post_path(@post)
    end

    def destroy
        like = Like.find_by(user_id: current_user.id, post_id: @post.id)
        like.destroy
        redirect_to posts_path
    end
    
    private
    def post_params
        @post = Post.find(params[:post_id])
    end
end
