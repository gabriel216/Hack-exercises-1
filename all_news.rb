#All news 

require_relative 'reddit'
require_relative 'mashable'
require_relative 'digg'

class All_news
	@@news=[]
	def self.show_all_news
		
			var=Reddit.reddit_data
			@@news << var
			
			var2=Mashable.mashable_data
			@@news << var2
			
			var3=Digg.digg_data
			@@news << var3
		return @@news	
	end
end	