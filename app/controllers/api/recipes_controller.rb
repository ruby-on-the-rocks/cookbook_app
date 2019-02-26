class Api::RecipesController < ApplicationController
  def one_recipe_method
    @recipe = Recipe.first
    render "one_recipe.json.jbuilder"
  end
end
