class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword] || 'chocolate'
    result = Recipe.for @keyword
    @results = result['results']
  end
end
