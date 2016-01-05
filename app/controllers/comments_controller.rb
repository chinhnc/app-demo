class CommentsController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    @comment = micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_back_or current_user
    else
      redirect_to root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer || root_url
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_content, :micropost_id, :pictute)
    end
end
