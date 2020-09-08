class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show following followers]
  USER_POSTS = 24

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @list_title = nil;
    if params[:likes]
      @posts = @user.like_posts.order(created_at: "DESC").page(params[:page]).per(USER_POSTS)
      @list_title = 'いいね一覧';
    else
      @posts = @user.posts.order(created_at: "DESC").page(params[:page]).per(USER_POSTS)
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render 'index'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'index'
  end
end
