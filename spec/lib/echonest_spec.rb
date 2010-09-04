require 'spec_helper'

describe Echonest do
  describe "find_song" do
    before do
      response = mock('response')
      RestClient.stub(:get).and_return(response)
      JSON.stub(:parse).with(response).and_return({
        'response' => {
          'songs' => [
            {}
          ]
        }
      })
    end

    context "Song has seven_digital_url" do
      subject do
        @song = mock('Song', :seven_digital_url => 'blah')
        Song.stub(:new).and_return(@song)
        Echonest.find_song('some', 'names')
      end

      it { should == @song }
    end

    context "Song has nil seven_digital_url" do
      subject do
        Song.stub(:new).and_return(mock('Song', :seven_digital_url => nil))
        lambda { Echonest.find_song('some', 'names') }
      end

      it { should raise_error(Echonest::SongNotFound) }
    end
  end
end
