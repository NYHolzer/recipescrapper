class Course
  attr_accessor :name

  def initialize(name)
    @name = name
    @recipes = []
  end

  def list_recipes_of_course
    Recipe.all.each do |recipe|
      if recipe.course == self
        recipe
      end
    end
  end

end
