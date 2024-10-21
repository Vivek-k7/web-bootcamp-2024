class HomeController < ApplicationController
  def index
    news_service = DataFetcherService.new
    @articles = news_service.fetch_headlines
    news_service.save_to_json
  end
end
