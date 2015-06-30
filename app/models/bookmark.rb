class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  before_create :http_url

  private

    def http_url
      if self.url[0..6] != 'http://' || self.url[0..7] != 'https://'
        self.url = self.url.prepend('http://')
      end
    end
end
