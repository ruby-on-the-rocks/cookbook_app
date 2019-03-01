class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.json.jbuilder"
  end

  def create
    @recipe = Recipe.new(
      title: params[:body_title],
      chef: params[:body_chef],
      ingredients: params[:body_ingredients],
      directions: params[:body_directions]
    )
    @recipe.save
    render "show.json.jbuilder"
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.title = params[:body_title] || @recipe.title
    @recipe.chef = params[:body_chef] || @recipe.chef
    @recipe.ingredients = params[:body_ingredients] || @recipe.ingredients
    @recipe.directions = params[:body_directions] || @recipe.directions
    @recipe.save
    render "show.json.jbuilder"
  end
end
