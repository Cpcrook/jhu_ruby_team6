class Recipe
  include HTTParty

  base_uri 'http://www.recipepuppy.com/api'
  default_params onlyImages: 1
  format :json

  def self.for(recipe_name)
    get('/', query: {q: recipe_name})
  end
end
