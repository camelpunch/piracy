class Track < ActiveRecord::Base
  acts_as_mappable
  before_save :set_url

  def set_url
    song = Echonest.find_song(artist_name, track_name)
    self.url = song.seven_digital_url
  end
end