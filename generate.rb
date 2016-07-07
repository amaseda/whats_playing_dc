require_relative "models/next_week"
require_relative "models/spotify"
require_relative "models/song_kick"
require_relative "env"

SongKick.artists.each do |artist|
  a = Artist.new artist
  top_track = a.top_track
  p = Playlist.new
  p.add top_track
end
