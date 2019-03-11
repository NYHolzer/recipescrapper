require 'nokogiri'
require 'open-uri'
require 'pry'

site = "https://www.allrecipes.com/recipes/79/desserts/?page=1"
site2 = "https://www.allrecipes.com/recipe/10702/jam-thumbprints/"

doc = Nokogiri::HTML(open(site))
doc2 = Nokogiri::HTML(open(site2))

binding.pry

#:title = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__title-link")[1].text
#:description = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__description").text
#:link =  doc.css("article.fixed-recipe-card")[0].css("a")[0].values[0]
#:chef = doc.css("article.fixed-recipe-card")[0].css(".cook-submitter-info h4").text.delete("By").lstrip

------
#2nd site within each recipe lookup:
#:ingredients = doc2.css("span.recipe-ingred_txt.added")[7].text -- count the array and then loop through the array for .text - Filter out "Add all ingredients to list"
#:directions = doc2.css("span.recipe-directions__list--item")[3].text -- count the array and then loop through - filter out empty ""
