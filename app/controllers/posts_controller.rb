class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :correct_user,   only: :destroy

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: "DESC").page(params[:page]).per(24)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投降に成功しました"
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :img)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      if @post.nil?
        flash[:alert] = "自分の投稿ではないため実行できません。"
        redirect_to root_url 
      end
    end
end
