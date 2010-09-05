require 'rest_client'
require 'json'

module Echonest
  class SongNotFound < RuntimeError; end

  def self.find_song(artist_name, track_name)
    artist_name = CGI::escape(artist_name)
    track_name = CGI::escape(track_name)

    url = "http://developer.echonest.com/api/v4/song/search?api_key=#{ENV['ECHONEST_API_KEY']}&format=json&results=1&artist=#{artist_name}&title=#{track_name}&bucket=id:7digital&bucket=tracks&bucket=id:playme"

    response = RestClient.get url
    json = JSON.parse(response)

    song = Song.new(json["response"]["songs"].first)

    raise SongNotFound if song.seven_digital_url.nil?

    song
  end
end

