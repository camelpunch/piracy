require 'spec_helper'

describe Track do
  describe "setting a url" do
    subject { @track }

    before do
      @track = Track.new

      Echonest.stub(:find_song).with(:artist_name, :track_name).
        and_return(mock('Song', :seven_digital_url => :expected_url))

      @track.track_name = :track_name
      @track.artist_name = :artist_name
      @track.set_url
    end

    its(:url) { should == :expected_url }
  end
end
