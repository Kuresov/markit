class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])
    authorize @like

    if @like.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
