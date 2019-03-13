require 'pry'

class Recipefinder::CLI

  def call
    instructions
    input_instructions
  end

  def instructions
    puts "Welcome to the Recipe Finder"
    puts "What course would you like a Recipe for?"
    puts "1. Breakfast"
    puts "2. Lunch"
    puts "3. Dinner"
    puts "Enter '1', '2', '3' to choose a course. Or type 'exit' to close the program"
  end

  def input_instructions
    input = gets.strip
    case input
    when input == "1"
      puts "top 10 breakfast recipes"
    when input == "2"
      puts "top 10 lunch recipes"
    when input == "3"
      puts "top 10 dinner recipes"
    else
      puts "Error: that is not a valid entry"
    end
  end

  def breakfast_recipes

  end

  def lunch_recipes

  end

  def dinner_recipes

  end
end
