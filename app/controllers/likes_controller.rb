class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    like = @micropost.likes.build(:user_id => current_user.id)
    if like.save
      respond_to do |format|
        format.html {redirect_to current_user}
        format.js
      end
    else
      flash[:notice] = "You cannot like this micropost. "
      redirect_back_or current_user
    end
  end

  def destroy
    like = Like.find(params[:id])
    @micropost = Micropost.find(like.micropost_id)
    like.destroy
    respond_to do |format|
      format.html {redirect_to current_user}
      format.js
    end
  end
end
