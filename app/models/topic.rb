class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  def to_param
    "#{id} #{title}".parameterize
  end
end
