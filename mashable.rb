#Mashable
require 'httparty'
require 'date'
require_relative 'news'

class Mashable

	@@mashable= 'http://mashable.com/stories.json'
	
	def self.mashable_data
		news=[]
			response = HTTParty.get @@mashable
			response.parsed_response["new"].each{|x| 
				 date = Date.parse(x["post_date"])
				news_features = {"title" => x["title"],
								"author" => x["author"],
								"date" => date,
				 				"url" => x["link"]}
				news <<  News.new(news_features)
			}
		return news	
	end
end	

	
			