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
  debug_output STDOUT
  def initialize

  end
  def add track
    playlist_id = "3NiX3gWEsRhI2KQYCFsRYK"
    track_uri = "spotify:track:" + track["id"]
    opts = {
      body: {
        uris: [track_uri]
      }.to_json,
      headers: {
        "Authorization" => "Bearer " + ENV['spotify_api_key'],
	"Accept" => "application/json",
	"Content-type" => "application/json"
      }
    }
    self.class.post("https://api.spotify.com/v1/users/jesseshawl/playlists/#{playlist_id}/tracks", opts)
  end
end