require 'spec_helper'

describe Track do
  describe "getting a clue" do
    subject { @track }

    context "when postcode is set" do
      before do
        @track = Track.new
        @track.stub(:postcode).and_return("N2 9GU")
      end

      its(:clue) {should == "Someone left a track in N2"}
    end

    context "when postcode is blank" do
      before do
        @track = Track.new
        @track.stub(:postcode).and_return(nil)
      end

      its(:clue) {should == "Someone left a track somewhere"}
    end
  end

  describe "setting a postcode" do
    subject { @track }
    
    before do
      @track = Track.new
      @track.lat = 51.535041
      @track.lng = -0.122041

      RestClient.stub(:get).with('http://www.uk-postcodes.com/latlng/51.535041,-0.122041.json').and_return(:response)
      JSON.stub(:parse).with(:response).and_return({'postcode' => 'N1 9GU'})

      @track.set_postcode
    end

    its(:postcode) {should == "N1 9GU"}
  end

  describe "setting a url" do
    subject { @track }

    context "song not found" do
      before do
        @track = Track.new

        Echonest.stub(:find_song).with(:artist_name, :track_name).
          and_raise(Echonest::SongNotFound)

        @track.track_name = :track_name
        @track.artist_name = :artist_name
        @track.set_url
      end

      its(:url) { should be_nil }
    end

    context "song is found" do
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
end
