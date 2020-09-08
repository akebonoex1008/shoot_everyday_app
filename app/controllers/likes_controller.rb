class LikesController < ApplicationController
  before_action :authenticate_user!

	def create
    @post = Post.find(params[:post_id])
    unless current_user?(@post.user)
      @post.like(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    else
      flash[:alert] = "自分の投稿へいいねはできません。"
      redirect_to current_user
    end
  end

	def destroy
		@post = Like.find(params[:id]).post
		@post.unlike(current_user)
		respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
