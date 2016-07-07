require "erb"
require_relative "models/next_week"
require_relative "models/spotify"
require_relative "models/song_kick"
require_relative "env"

@shows = SongKick.shows

SongKick.artists.each do |artist|
  begin
    a = Artist.new artist
    top_track = a.top_track
    p = Playlist.new
    p.add top_track
  rescue
  end
  break
end

erb = ERB.new(File.open("#{__dir__}/views/index.erb").read)
d = Date.today.strftime("%F")
File.write("public/dc-#{d}.html", erb.result)
puts erb.result
