class Chef
  attr_accessor :name, :recipes

  def recipes
    @recipes = []
    Recipe.all.each do |recipe|
      recipe.chef == self.name
      self.recipes << recipe
    end
  end
end
