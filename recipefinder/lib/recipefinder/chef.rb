class Chef
  attr_accessor :recipes
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def recipes
    @recipes = []
    Recipe.all.each do |recipe|
      recipe.chef == self.name
      self.recipes << recipe
    end
  end
end
