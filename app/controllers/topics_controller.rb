class TopicsController < ApplicationController
  def index
    @topics = Topic.joins(:bookmarks).uniq # May want to make this more user-friendly... How would one create a topic, which is then empty, and then add a bookmark to it if they left the topic's #show page?
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

    def create
      @topic = current_user.topics.build(params.require(:topic).permit(:title))
      authorize @topic

      if @topic.save
        redirect_to @topic, notice: "New topic saved"
      else
        flash[:error] = "There was a problem saving your post. Please try again!"
        redirect_to topics_path
      end
    end

    def update
      @topic = Topic.find(params[:id])
      authorize @topic

      if @topic.update_attributes(params.require(:topic).permit(:title))
        redirect_to @topic
      else
        flash[:error] = "There was a problem updating #{@topic.title}"
        render :edit
      end
    end

    def destroy
      @topic = Topic.find(params[:id])
      authorize @topic

      if @topic.destroy
        flash[:notice] = "#{@topic.title} has been deleted"
        redirect_to topics_path
      else
        flash[:error] = "There was a problem deleting the topic. Please try again!"
        render :show
      end
    end
end
