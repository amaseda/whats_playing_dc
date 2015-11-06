require "sinatra"
require "sinatra/reloader"
require_relative "models/next_week"
require_relative "models/song_kick"
require_relative "env"

get "/" do
  @shows = SongKick.shows
  erb :index
end