class LikesController < ApplicationController
    def create
        @like = Like.new()
        @like.author = current_user
        @like.post = Post.find(params[:post_id])
        p @like
        if @like.save
            redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
        else
            render :new, status: :unprocessable_entity
        end
    end
end