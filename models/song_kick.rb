require "httparty"
require "pry"
class SongKick
  def self.shows(page=1, shows=[])
    min_date = NextWeek.start
    max_date = NextWeek.end
    url = "http://api.songkick.com/api/3.0/events.json?location=sk:1409&apikey=" + ENV['songkick_api_key'] + "&min_date=#{min_date}&max_date=#{max_date}&page=#{page}"
    res = HTTParty.get(url)
    shows << res.parsed_response["resultsPage"]["results"]["event"]
    total = res.parsed_response["resultsPage"]["totalEntries"]
    puts "total = #{total}"
    pages = (total.to_f / 50.to_f).ceil
    if pages > 1 && page <= pages
      page += 1
      puts "getting #{page}"
      self.shows(page, shows)
    end
    return shows.flatten
  end
  def self.artists
    artists = self.shows.map do |show|
      if show
	show["performance"].map do |perf|
	  perf["artist"]["displayName"]
	end
      end
    end
    artists.flatten
  end
end
