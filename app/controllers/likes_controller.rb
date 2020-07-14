class LikesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.like(current_user)
		redirect_to @post.user
  end

	def destroy
		@post = Like.find(params[:id]).post
		@post.unlike(current_user)
		redirect_to @post.user
  end
end
