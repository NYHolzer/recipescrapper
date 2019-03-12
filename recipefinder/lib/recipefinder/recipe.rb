class Recipe
  #all will get from the scrapper
  attr_accessor :title, :description, :ingredients, :directions, :link
  attr_reader :chef

  @@all = []

  def initialize
    @@all << self
  end

  def chef=(chef)
    @chef = Chef.new(chef)
  end

  def self.all
    @@all
  end
end
