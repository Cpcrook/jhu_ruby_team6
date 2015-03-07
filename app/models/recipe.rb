class Recipe < ActiveRecord::Base
  include HTTParty

  base_uri 'http://www.recipepuppy.com/api'
  format :json

  def self.for(recipe_name)
    get'/', query: {q: recipe_name, onlyImages: 1}
  end
end
