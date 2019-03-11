class Recipe
  #all will get from the scrapper
  attr_accessor :name, :description, :ingredients, :directions, :chef, :link

  @@all = []

  def initialize
    @@all << self
  end

  def chef=(chef)
    @chef = Chef.new(chef)
  end
end
