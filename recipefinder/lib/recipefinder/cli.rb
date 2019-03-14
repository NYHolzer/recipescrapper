require_relative './chef.rb'
require_relative './recipe.rb'
require_relative './course.rb'
require_relative './scrapper.rb'
require 'pry'

class Recipefinder::CLI

  def call
    instructions
    until (user_input = gets.strip) == "exit"
      input_instructions(user_input)
    end
  end

  def instructions
    puts "Welcome to the Recipe Finder"
    puts "What would you like a Recipe for?"
    puts "1. Appetizers"
    puts "2. Main Dishes"
    puts "3. Desserts"
    puts "Enter '1', '2', '3' to choose a course. Or type 'exit' to close the program"
  end

  def input_instructions(user_input)
    case user_input
    when "1"
      puts "top 10 appetizer recipes"
    when "2"
      puts "top 10 main dishes recipes"
    when "3"
      puts "top 10 desserts recipes"
    else
      puts "Error: that is not a valid entry"
    end
  end

  def appetizer_recipes
    appetizer_scrap = Scrapper.new
    appetizer_scrap.site = websites[appetizers]
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{r.title}"
      puts "#{r.description}"
      counter += 1
    end
  end

  def lunch_recipes

  end

  def dinner_recipes

  end

  def choose_recipe
    puts "Choose the number of the recipe you'd like to cook:"
  end
end
