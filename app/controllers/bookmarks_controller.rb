class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

    def create
      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.new(params.require[:bookmark].permit[:url, :topic_id])

      if @bookmark.save
        redirect_to @topic, notice: "New bookmark saved"
      else
        flash[:error] = "There was a problem saving your bookmark. Please try again!"
        redirect_to @topic
      end
    end


  def edit
    @bookmark = Bookmark.find(params[:id])
  end

    def update
      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.find(params[:id])

      if @bookmark.update_attributes(params.require[:bookmark].permit[:url])
        redirect_to @topic, notice: "Bookmark successfully edited"
      else
        flash[:error] = "There was a problem editing your bookmark. Please try again!"
        render :edit
      end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.find(params[:id])

      if @bookmark.destroy
        flash[:notice] = "Bookmark has been deleted"
        redirect_to @topic
      else
        flash[:error] = "There was a problem deleting your bookmark. Please try again!"
        redirect_to @topic
      end
    end
end
