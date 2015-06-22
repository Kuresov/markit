class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

    def create
      @topic = Topic.new(params.require(:topic).permit(:title, :user_id))

      if @topic.save
        redirect_to @topic, notice: "New topic saved"
      else
        flash[:error] = "There was a problem saving your post. Please try again!"
        redirect_to topics_path
      end
    end

    def update
      @topic = Topic.find(params[:id])

      if @topic.update_attributes(params.require(:topic).permit(:title))
        redirect_to @topic
      else
        flash[:error] = "There was a problem updating #{@topic.title}"
        render :edit
      end
    end

    def destroy
      @topic = Topic.find(params[:id])

      if @topic.destroy
        flash[:notice] = "#{@topic.title} has been deleted"
        redirect_to topics_path
      else
        flash[:error] = "There was a problem deleting the topic. Please try again!"
        render :show
      end
    end
end
