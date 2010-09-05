When /^I drop me a track with tha following attributes:$/ do |table|
  visit '/tracks', :post, Hash[table.raw]
end

Then /^there should be a track in tha database with attributes:$/ do |table|
  attributes = Hash[table.raw]
  Track.find_by_track_name_and_artist_name_and_lat_and_lng_and_url!(
    attributes['track_name'],
    attributes['artist_name'],
    BigDecimal.new(attributes['lat']),
    BigDecimal.new(attributes['lng']),
    attributes['url']
  )
end

Given /^there be a track with attributes:$/ do |table|
  attributes = Hash[table.raw]
  Track.create! attributes
end

When /^I attempt to plunder at "([^"]*)"$/ do |latlng|
  lat, lng = latlng.split(',')
  visit '/tracks', :get, :lat => lat, :lng => lng
end

When /^I sail t' (.*)$/ do |page|
  When 'I go to ' + page
end

Then /^I should receive some JSON containing "([^"]*)"$/ do |arg1|
  response.body.should include(arg1)
end

Then /^I should receive some JSON not containing "([^"]*)"$/ do |arg1|
  response.body.should_not include(arg1)
end


