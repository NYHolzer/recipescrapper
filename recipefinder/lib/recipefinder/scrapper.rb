require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './chef.rb'
require_relative './recipe.rb'
require_relative './course.rb'

# site = "https://www.allrecipes.com/recipes/79/desserts/?page=1"
# site2 = "https://www.allrecipes.com/recipe/10702/jam-thumbprints/"
#
# doc = Nokogiri::HTML(open(site))
# doc2 = Nokogiri::HTML(open(site2))

class Scrapper

  attr_accessor :site, :websites

  def initialize
    @websites = {:appetizers => "https://www.allrecipes.com/recipes/appetizers-and-snacks/",
     :main_dishes => "https://www.kosher.com/recipes/main-dishes",
     :desserts => "https://www.kosher.com/recipes/desserts"}
  end

  def scrap
    @site = self.websites[:appetizers]
    self.get_page
    self.get_recipes
    self.make_recipes
    self.get_ing_dir
    sleep 5
    @site = self.websites[:main_dishes]
    self.get_page
    self.get_recipes
    self.make_recipes
    self.get_ing_dir
    sleep 5
    @site = self.websites[:desserts]
    self.get_page
    self.get_recipes
    self.make_recipes
    self.get_ing_dir
  end

  def get_page
    doc = Nokogiri::HTML(open(self.site))
  end

  def get_recipes
    self.get_page.css("article.fixed-recipe-card")
  end

  def make_recipes
    course = Course.new(site.split(/[\/]/)[4])
    recipes = self.get_recipes.first(8)
      recipes.each do |recipe|
        r = Recipe.new
        r.course = course
        r.title = recipe.css(".fixed-recipe-card__title-link")[1].text
        r.link = recipe.css("a")[0].attributes.values[0].value
      end
  end

  def get_ing_dir
    Recipe.all.each do |r|
      site = r.link
      recipesite = Nokogiri::HTML(open(site))
        recipesite.css("span.recipe-ingred_txt.added").each do |i|
          if r.ingredients.find {|r| r == i.text} == nil
            r.ingredients << i.text
          end
        end
        recipesite.css("span.recipe-directions__list--item").each do |d|
        if r.directions.find {|r| r == d.text} == nil
          r.directions << d.text.strip
        end
      end
    end
  end

end



# Scrapper.new.scrap

#kosher.com
#:title = doc.css("div.item-recipe__holder")[1].css("h4.item-recipe__title")[0].text
#:link = doc.css("div.item-recipe__holder")[0].css("a")[0].attributes.values[0].value
#:chef = doc.css("div.item-recipe__meta")[0].css("a")[0].text
#--------
#2nd site
#:ingredients = doc.css("span.form-checkbox__title")[0].text

#:directions doc.css("//div[@itemprop = 'recipeInstructions']").-- close

#ALLRECIPES.com
#:title = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__title-link")[1].text
#:description = doc.css("article.fixed-recipe-card")[0].css(".fixed-recipe-card__description").text
#:link =  doc.css("article.fixed-recipe-card")[0].css("a")[0].values[0]
#:chef = doc.css("article.fixed-recipe-card")[0].css(".cook-submitter-info h4").text.delete("By").lstrip

#------
#2nd site within each recipe lookup:
#:ingredients = doc2.css("span.recipe-ingred_txt.added")[7].text -- count the array and then loop through the array for .text - Filter out "Add all ingredients to list"
#:directions = doc2.css("span.recipe-directions__list--item")[3].text -- count the array and then loop through - filter out empty ""
