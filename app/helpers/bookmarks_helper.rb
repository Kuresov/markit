require 'embedly'
require 'json'

module BookmarksHelper

  def embed(url)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API']
    obj = embedly_api.oembed :url => url
    return obj[0].marshal_dump
  end

end
