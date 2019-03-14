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
      puts "top 10 breakfast recipes"
    when "2"
      puts "top 10 lunch recipes"
    when "3"
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
