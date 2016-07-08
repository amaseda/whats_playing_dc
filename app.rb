require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"
require "mailchimp"
require "pry"
require_relative "models/next_week"
require_relative "models/song_kick"
require_relative "models/user"
require_relative "env"

get "/" do
  redirect "/dc"
end

get "/dc" do
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
