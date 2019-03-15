require_relative './chef.rb'
require_relative './recipe.rb'
require_relative './course.rb'
require_relative './scrapper.rb'
require 'pry'

class Recipefinder::CLI

  attr_accessor :num_of_choices

  def call
    instructions
    until (user_input = gets.strip) == "exit"
      input_instructions(user_input)
      choose_recipe(user_input)
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
      appetizer_recipes
    when "2"
      puts "top 10 main dishes recipes"
    when "3"
      puts "top 10 desserts recipes"
    else
      puts "Error: that is not a valid entry. Please enter a number or 'exit' to close"
    end
  end

  def appetizer_recipes
    appetizer_scrap = Scrapper.new
    appetizer_scrap.site = websites[appetizers]
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{r.title}"
      puts "By #{r.chef}"
      counter += 1
    end
    @num_of_choices = Recipe.all.count
  end

  def main_recipes
    main_scrap = Scrapper.new
    main_scrap.site = websites[main_dishes]
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{r.title}"
      puts "By #{r.chef}"
      counter += 1
    end
    @num_of_choices = Recipe.all.count
  end

  def desserts_recipes
    desserts_scrap = Scrapper.new
    desserts_scrap.site = websites[main_dishes]
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{r.title}"
      puts "By #{r.chef}"
      counter += 1
    end
    @num_of_choices = Recipe.all.count
  end

  def choose_recipe(user_input)
    puts "Choose the number of the recipe you'd like to cook:"
    user_input = gets.strip
    if user_input <= self.num_of_choices && user_input > 0
      recipe_find(user_input)
    else
      puts "Error: Please enter a number between 1 and #{self.num_of_choices}."
      puts "If your ready to start cookin' and want to exit, type 'exit'."
    end
  end

  def recipe_find(user_input)
    r = Recipe.all[user_input.to_i]
    puts r.ingredients
    puts r.directions
  end
end
