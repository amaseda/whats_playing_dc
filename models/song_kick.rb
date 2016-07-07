require "httparty"
require "pry"
class SongKick
  def self.shows
    min_date = NextWeek.start
    max_date = NextWeek.end
    url = "http://api.songkick.com/api/3.0/events.json?location=sk:1409&apikey=" + ENV['songkick_api_key'] + "&min_date=#{min_date}&max_date=#{max_date}"
    HTTParty.get(url).parsed_response["resultsPage"]["results"]["event"]
  end
  def self.artists
    artists = self.shows.map do |show|
      show["performance"].map do |perf|
        perf["artist"]["displayName"]
      end
    end
    artists.flatten
  end
end
