require 'spec_helper'

describe Song do
  describe "seven_digital_url" do
    context "seven_digital_id is nil" do
      subject do
        song = Song.new({})
        song.stub(:seven_digital_id).and_return(nil)
        song.seven_digital_url
      end

      it { should be_nil }
    end
  end

  describe "seven_digital_id" do
    context "tracks are nil" do
      subject { Song.new({}).seven_digital_id }
      it { should be_nil }
    end
  end
end
