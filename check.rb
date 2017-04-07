require 'hack_news'
class Check
		def self.check
			loop do
				print "Desea leer otra noticia?(S/n):"
				n= gets.chomp
				if n == "s" then
					news_article_number
				end
				break if (n == "n")
			end			
		end
end		