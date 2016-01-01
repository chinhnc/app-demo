class LikesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    like = micropost.likes.build(:user_id => current_user.id)
    if like.save
      flash[:success] = "like Ok"
      redirect_back_or current_user
    else
      redirect_to root_url
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    flash[:success] = "unlike ok"
    redirect_back_or current_user
  end
end
