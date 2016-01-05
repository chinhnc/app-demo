class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html {redirect_back_or current_user}
        format.js
      end
    else
      flash[:notice] = "You cannot comment"
      redirect_to root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @delete_id = @comment.id
    @comment.destroy
    respond_to do |format|
      format.html {redirect_back_or current_user}
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_content, :micropost_id, :pictute)
    end
end
