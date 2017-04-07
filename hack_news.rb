#Noticiero Hack
require 'launchy'
require_relative 'news'
require_relative 'reddit'
require_relative 'mashable'
require_relative 'digg'
require_relative 'all_news'

class Hack_news
	system("clear")
	@@news=[]
	def show_menu
		puts "1-Reddit"
		puts "2-Mashable"
		puts "3-Digg"
		puts "4-Mostrar todas las noticias "
		puts ""
		print "Ingrese el numero que coincida con el sitio de las noticias que desea ver(1,2,3 o 4):"
	end

	def get_data
		menu = gets.chomp.to_i
		case menu 
		when 1 then
			puts "---------Reddit--------------------------"
			var=Reddit.reddit_data
			@@news << var
		when 2 then
			puts "---------Mashable--------------------------"
			var2=Mashable.mashable_data
			@@news << var2
		when 3 then
			puts "---------Digg--------------------------"
			var3=Digg.digg_data
			@@news << var3
		when 4 then 
			var4= All_news.show_all_news
			@@news << var4	
		else
			puts "Ingrese un numero que coincida con alguno de los sitios de informacion(1,2,3 o 4):"
			get_data
		end			
		@@news.flatten!
	end

	def show_news
		puts ""
		puts "Noticiero Hack"
		index = 1
		@@news.each{|x| 
			puts "N#: #{index}"
			puts "Titulo: #{x.title}"
			puts "Autor: #{x.author}"
			puts "Fecha: #{x.date}"
			puts "Url: #{x.url}"
			puts ""
			index = index + 1
		}
	end

		def	news_article_number
			print "Ingrese el numero del articulo que desee ver: "
			numero=gets.chomp.to_i
			url = @@news[numero-1].url
			Launchy.open("#{url}")
		end

		def check
			loop do
				print "Desea leer otra noticia?(S/n):"
				n= gets.chomp
				if n == "s" then
					news_article_number
				end
				break if (n== "n")
			end			
		end
end	

noticias = Hack_news.new
noticias.show_menu
noticias.get_data
noticias.show_news
noticias.news_article_number
noticias.check