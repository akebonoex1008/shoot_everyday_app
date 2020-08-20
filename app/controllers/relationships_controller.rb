class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    unless current_user?(@user)
      current_user.follow(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      flash[:alert] = "自分自身をフォローできません。"
      redirect_to @user
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    flash[:notice] = "フォロー解除しました"
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end