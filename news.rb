
class News
	attr_accessor :title, :author, :date, :url

	def initialize(news_features)

		@title=news_features['title']
		@author=news_features['author']
		@date=news_features['date']
		@url=news_features['url']
	 end 
end	