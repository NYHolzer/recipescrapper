require 'nokogiri'
require 'open-uri'
require 'pry'

site = "https://www.allrecipes.com/recipes/79/desserts/?page=1"

doc = Nokogiri::HTML(open(site))

binding.pry

#:title = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__title-link")[1].text
