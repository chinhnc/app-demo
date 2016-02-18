class StaticPagesController < ApplicationController
  def home
    store_location
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @comment = current_user.comments.build
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
