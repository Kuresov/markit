class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def to_param
    "#{id} #{email.split('@').first}".parameterize
  end

  def admin?
    role == 'admin'
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
