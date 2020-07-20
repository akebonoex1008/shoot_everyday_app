class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(content: params[:comment][:content], post_id: params[:post_id])
    
    if @comment.save
      flash[:success] = "投降に成功しました"
      redirect_to @comment.post.user
    else
      flash[:success] = "投降に失敗"
      redirect_to @comment.post.user
    end
  end

  def destroy
  end

  def edit
  end
end
