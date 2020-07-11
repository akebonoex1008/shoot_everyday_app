class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
    @title = "index"
    @show_title = "ユーザー 一覧"
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: "DESC").page(params[:page]).per(24)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    @title = "following"
    @show_title = "フォロー中のユーザー"
    render 'index'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    @title = "followers"
    @show_title = "フォローしてくれたユーザー"
    render 'index'
  end
end
