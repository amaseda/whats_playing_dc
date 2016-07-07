require "sinatra"
require "sinatra/reloader"
require_relative "models/next_week"
require_relative "models/song_kick"
require_relative "env"

get "/" do
  redirect "/dc-2016-07-07.html"
end

get "/json" do
  @shows = SongKick.shows
  @shows.to_json
end
