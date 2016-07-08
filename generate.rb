require "erb"
require "sinatra/activerecord"
require_relative "models/next_week"
require_relative "models/spotify"
require_relative "models/song_kick"
require_relative "models/user"
require_relative "env"

@shows = SongKick.shows
tracks = []
SongKick.artists.each do |artist|
  begin
    a = Artist.new artist
    top_track = a.top_track
    tracks << top_track
  rescue
  end
end
p = Playlist.new
p tracks
p.add tracks

erb = ERB.new(File.open("#{__dir__}/views/generated.erb").read)
d = Date.today.strftime("%F")
File.write("public/dc.json", erb.result)
