require "sinatra"
require "sinatra/reloader"
require "mailchimp"
require "pry"
require_relative "models/next_week"
require_relative "models/song_kick"
require_relative "env"

get "/" do
  redirect "/dc"
end

get "/dc" do
  erb :index
end

post "/signup" do
  mailchimp = Mailchimp::API.new(ENV['mailchimp_api_key'])
  mailchimp.lists.subscribe( ENV['mailchimp_list_id'], { 
    "email" => params[:email]
  })
  erb :thanks
end

get "/json" do
  @shows = SongKick.shows
  @shows.to_json
end
