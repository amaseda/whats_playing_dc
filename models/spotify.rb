require 'httparty'
require 'pry'
require_relative '../env'

class Artist
  def initialize name
    @name = name
    @id = id
  end
  def id
    rs = HTTParty.get("https://api.spotify.com/v1/search?q=#{@name}&type=artist")
    rs["artists"]["items"][0]["id"]
  end
  def top_track
    rs = HTTParty.get("https://api.spotify.com/v1/artists/#{@id}/top-tracks?country=US")["tracks"][0]
    rs
  end
end

class Playlist
  include HTTParty
  debug_output $stdout
  def initialize

  end
  def add tracks
    playlist_id = "6DeZWe3bJym4SkTvt1yWQ6"
    track_uris = tracks.map{ |track| 
      begin
	"spotify:track:" + track["id"] 
      rescue
	nil
      end
    }.compact
    opts = {
      body: {
        uris: track_uris
      }.to_json,
      headers: {
        "Authorization" => "Bearer " + ENV['spotify_api_key'],
	"Accept" => "application/json",
	"Content-type" => "application/json"
      }
    }
    self.class.put("https://api.spotify.com/v1/users/whatsplayingin/playlists/#{playlist_id}/tracks", opts)
  end


end
