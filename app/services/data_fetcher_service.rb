require 'net/http'
require 'json'
require 'uri'

class DataFetcherService
  NEWS_API_URL = "https://newsapi.org/v2/top-headlines"
  API_KEY = "12ab539d4c80428bacb7db357b0416ac" 

  def fetch_headlines
    uri = URI("#{NEWS_API_URL}?country=us&pageSize=10&apiKey=#{API_KEY}")
    resp = Net::HTTP.get(uri)
    JSON.parse(resp)["articles"]
  end

  def save_to_json
    top_headlines = fetch_headlines
    File.open(Rails.root.join('public', 'headlines.json'), "w") do |file|
      file.write(JSON.pretty_generate(top_headlines))
    end
    puts "Headlines saved to public/headlines.json"
  end
end
