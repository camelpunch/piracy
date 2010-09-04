class AddPostcodeToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :postcode, :string
  end

  def self.down
    remove_column :tracks, :postcode
  end
end
