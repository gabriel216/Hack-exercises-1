#Digg
require 'httparty'
require 'date'
require_relative 'news'

class Digg

	@@digg= 'http://digg.com/api/news/popular.json'
	
	def self.digg_data
		news=[]
			response = HTTParty.get @@digg
			response.parsed_response["data"]["feed"].each{|x|
				a = x["date"].to_s
				date = Date.parse(DateTime.strptime(a, '%s').to_s)
				news_features = {"title" => x["content"]["title_alt"], 
								"author" => x["content"]["author"], 
								"date" => date, 	
								"url" => x["content"]["url"]}
				news << News.new(news_features)	
			}
		return news	
	end
end	

