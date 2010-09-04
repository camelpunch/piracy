require 'ostruct'

SEVEN_DIGITAL_API_KEY = 'musichackday'

class Song < OpenStruct
  def initialize(args)
    super(args)
  end

  def seven_digital_url
    return nil if seven_digital_id.nil?
    "http://api.7digital.com/1.2/track/preview?trackid=#{self.seven_digital_id}&country=gb&oauth_consumer_key=#{SEVEN_DIGITAL_API_KEY}"
  end

  def seven_digital_id
    return nil if tracks.blank?

    self.tracks.each do |t|
      if t['catalog'] == "7digital"
        foreign_id = t['foreign_id'] 
        return foreign_id.gsub('7digital:track:','')
      end
    end
  end
end
