require "sinatra"
require "date"
require "sinatra/activerecord"
require "sinatra/reloader"
require "pry"
require_relative "models/next_week"
require_relative "models/song_kick"
require_relative "models/user"
require_relative "env"
also_reload "models/song_kick"

get "/" do
  redirect "/dc"
end

get "/dc" do
  @data = JSON.parse(File.read("#{__dir__}/public/dc.json"))
  @shows = {}
  @dayz = []
  @data['shows'].each do |show|
    if show
      @shows[show['start']['date']] ||= []
      @shows[show['start']['date']] << show
      @dayz << show['start']['date']
    end
  end
  @dayz = @dayz.uniq
  erb :index
end

post "/signup" do
  u = User.where(email: params[:email]).first || User.create(email: params[:email])
  @users = User.all
  erb :thanks
end

get "/json" do
  @shows = SongKick.shows
  @shows.to_json
end
