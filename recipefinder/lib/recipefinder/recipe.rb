require_relative './scrapper.rb'

class Recipe
  #all will get from the scrapper
  attr_accessor :title, :description, :ingredients, :directions, :link, :course
  attr_reader :chef

  @@all = []

  def initialize
    @ingredients = []
    @directions = []
    @@all << self
  end

  def chef=(chef)
    @chef = Chef.new(chef)
  end

  def self.all
    @@all
  end

  def self.alphabetized_list
    self.all.sort_by!{|recipe| recipe.title}
    binding.pry
  end
end
