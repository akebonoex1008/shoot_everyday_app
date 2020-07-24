class PostsController < ApplicationController

  before_action :correct_user,   only: :destroy

  def index
    @posts = Post.all.page(params[:page]).per(24)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投降に成功しました"
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :img)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
