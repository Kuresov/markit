class UsersController < ApplicationController
  helper_method :get_bookmark

  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = Bookmark.joins(:likes).where(likes: { user_id: @user.id })
  end
end
