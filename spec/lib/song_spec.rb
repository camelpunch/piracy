require 'spec_helper'

describe Song do
  describe "seven_digital_id" do
    context "tracks are nil" do
      subject { Song.new({}).seven_digital_id }
      it { should be_nil }
    end
  end
end
