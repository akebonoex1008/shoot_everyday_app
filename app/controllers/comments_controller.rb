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

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if !params[:update] && !params[:cancel]
      redirect_to request.referrer
    elsif params[:update]
      @comment.update(comment_params)
    end

    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
