atom_feed do |feed|
  feed.title "Piratical Clues"
  feed.updated @tracks.first.created_at

  @tracks.each do |track|
    feed.entry(track) do |entry|
      entry.title track.clue
    end
  end
end
