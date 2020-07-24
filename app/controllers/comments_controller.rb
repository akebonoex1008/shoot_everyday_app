class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(content: params[:comment][:content], post_id: params[:post_id])
    
    if @comment.save
      flash[:success] = "投降に成功しました"
      @post = @comment.post
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    else
      flash[:success] = "投降に失敗"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
