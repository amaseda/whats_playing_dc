require "sinatra"
require "sinatra/reloader"
require_relative "models/next_week"

get "/" do
  monday = NextWeek.start.strftime("%Y-%m-%d")
  sunday = NextWeek.end.strftime("%Y-%m-%d")
  "The next closest Monday is #{monday}. The Sunday after that is #{sunday}"
end