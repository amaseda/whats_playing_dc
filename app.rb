require "sinatra"
require "sinatra/reloader"
require_relative "models/next_week"

get "/" do
  @monday = NextWeek.start.strftime("%Y-%m-%d")
  @sunday = NextWeek.end.strftime("%Y-%m-%d")
  erb :index
end