class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS: #{params}"

    @user = User.where(email: params[:sender])
    @topic = Topic.where(title: params[:subject])
    url = params["body-plain"]

    if @user.blank?
      name = params[:sender].split("@").first
      user = User.new(name: name, email: params[:sender], password: "password")
      user.save!
    end

    if @topic.blank?
      topic = Topic.new(title: params[:subject], user_id: user)
      topic.save!
    end

    bookmark = Bookmark.create(topic_id: topic.id, url: url)

    head 200
  end
end
