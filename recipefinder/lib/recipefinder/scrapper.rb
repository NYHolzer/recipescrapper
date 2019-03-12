require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './chef.rb'
require_relative './recipe.rb'
require_relative './course.rb'

site = "https://www.allrecipes.com/recipes/79/desserts/?page=1"
site2 = "https://www.allrecipes.com/recipe/10702/jam-thumbprints/"

doc = Nokogiri::HTML(open(site))
doc2 = Nokogiri::HTML(open(site2))

class Scrapper

  def site   #Leaving option open to change site based on user input
    @site = "https://www.allrecipes.com/recipes/79/desserts/"
  end

  def get_page
    Nokogiri::HTML(open(self.site))
  end

  def get_recipes
    self.get_page.css("article.fixed-recipe-card")
  end

  def make_recipes
    counter = self.get_recipes.count - 1
    while counter != 0
      self.get_recipes.each do |recipe|
        r = Recipe.new
        r.title = recipe.css(".fixed-recipe-card__title-link")[1].text
        r.description = recipe.css(".fixed-recipe-card__description").text
        chefname = recipe.css(".cook-submitter-info h4").text.delete("By").lstrip
        r.chef = chefname
        r.link = recipe.css("a")[0].values[0]
      end
      counter -= 1
    end
    binding.pry
  end

end

Scrapper.new.make_recipes
#:title = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__title-link")[1].text
#:description = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__description").text
#:link =  doc.css("article.fixed-recipe-card")[0].css("a")[0].values[0]
#:chef = doc.css("article.fixed-recipe-card")[0].css(".cook-submitter-info h4").text.delete("By").lstrip



#------
#2nd site within each recipe lookup:
#:ingredients = doc2.css("span.recipe-ingred_txt.added")[7].text -- count the array and then loop through the array for .text - Filter out "Add all ingredients to list"
#:directions = doc2.css("span.recipe-directions__list--item")[3].text -- count the array and then loop through - filter out empty ""
