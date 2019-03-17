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
      repeat
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
      choose_recipe(user_input)
    when "2"
      main_recipes
      choose_recipe(user_input)
    when "3"
      desserts_recipes
      choose_recipe(user_input)
    else
      puts "Error: that is not a valid entry. Please enter a number or 'exit' to close"
    end
  end

  def appetizer_recipes
    a_scrap = Scrapper.new
    a_site = a_scrap.websites[:appetizers]
    a_scrap.site = a_site
    a_scrap.get_page
    a_scrap.get_recipes
    a_scrap.make_recipes
    a_scrap.get_ing_dir
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{recipe.title}"
      puts "By #{recipe.chef}"
      counter += 1
    end
    @num_of_choices = Recipe.all.count
  end

  def main_recipes
    main_scrap = Scrapper.new
    main_scrap.site = websites[:main_dishes]
    a_scrap.get_page
    a_scrap.get_recipes
    a_scrap.make_recipes
    a_scrap.get_ing_dir
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{recipe.title}"
      puts "By #{recipe.chef}"
      counter += 1
    end
    @num_of_choices = Recipe.all.count
  end

  def desserts_recipes
    desserts_scrap = Scrapper.new
    desserts_scrap.site = websites[:desserts]
    a_scrap.get_page
    a_scrap.get_recipes
    a_scrap.make_recipes
    a_scrap.get_ing_dir
    counter = 1
    Recipe.all.each do |recipe|
      puts "#{counter}." + " #{recipe.title}"
      counter += 1
    end
    @num_of_choices = Recipe.all.count
  end

  def choose_recipe(user_input)
    puts "Choose the number of the recipe you'd like to cook:"
    user_input = gets.strip
    binding.pry
    if user_input.to_i <= self.num_of_choices && user_input.to_i > 0
      puts "hello"
      # recipe_find(user_input)
    else
      puts "Error: Please enter a number between 1 and #{self.num_of_choices}."
      puts "If your ready to start cookin' and want to exit, type 'exit'."
    end
  end

  def recipe_find(user_input)
    r = Recipe.all[user_input.to_i]
    puts "You will need the following ingredients:"
    puts r.ingredients
    puts "---------------"
    puts "Instructions:"
    r.directions.each_with_index do |dir, index|
      puts "#{index+1}." + dir
    end
  end

  def repeat
    puts "Would you like to make something else?"
    puts "Type '1' for Appetizers, '2' for main dishes, '3' for desserts and 'exit' to close"
    input_instructions(user_input)
  end
end
