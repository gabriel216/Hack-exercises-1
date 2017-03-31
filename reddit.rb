#Reddit
require 'httparty'
require 'date'
require_relative 'news'

class Reddit

	@@reddit='https://www.reddit.com/.json'

	def self.reddit_data	
		news=[]
			response = HTTParty.get @@reddit
			response.parsed_response["data"]["children"].each{|x|
			date_var = x["data"]["created"].to_s
			date = Date.parse(DateTime.strptime(date_var, '%s').to_s)
				news_features = {"title" => x["data"]["title"],	
								"author" => x["data"]["author"],
								"date" => date, 
								"url" => x["data"]["url"]}
				news <<  News.new(news_features)
			}
		return news	
	end
end	