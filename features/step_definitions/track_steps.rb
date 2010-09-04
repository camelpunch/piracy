When /^I drop a track with the following attributes:$/ do |table|
  visit '/tracks', :post, Hash[table.raw]
end

Then /^there should be a track in the database with attributes:$/ do |table|
  attributes = Hash[table.raw]
  Track.find_by_track_name_and_artist_name_and_lat_and_lng_and_url!(
    attributes['track_name'],
    attributes['artist_name'],
    BigDecimal.new(attributes['lat']),
    BigDecimal.new(attributes['lng']),
    attributes['url']
  )
end

