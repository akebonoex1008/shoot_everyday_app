class LikesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.like(current_user)
		respond_to do |format|
      format.html { redirect_to @post.user }
      format.js
    end
  end

	def destroy
		@post = Like.find(params[:id]).post
		@post.unlike(current_user)
		respond_to do |format|
      format.html { redirect_to @post.user }
      format.js
    end
  end
end
