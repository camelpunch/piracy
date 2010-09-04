class Track < ActiveRecord::Base
  acts_as_mappable :default_units => :kms
  before_save :set_url, :set_postcode

  default_scope :order => 'id DESC'

  def set_url
    song = Echonest.find_song(artist_name, track_name)
    self.url = song.seven_digital_url
  rescue Echonest::SongNotFound
  end

  def set_postcode
    url = "http://www.uk-postcodes.com/latlng/#{lat},#{lng}.json"
    response = RestClient.get url
    self.postcode = JSON.parse(response)['postcode']
  end

  def short_postcode
    postcode.split.first
  end

  def clue
    if postcode
      "Someone left a track in #{self.short_postcode}"
    else
      "Someone left a track somewhere"
    end
  end
  
  def distance
    super.to_f
  end
end
