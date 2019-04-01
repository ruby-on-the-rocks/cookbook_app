class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    title_search = params[:title]
    if title_search
      @recipes = @recipes.where("title ILIKE ?", "%#{title_search}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render "index.json.jbuilder"
  end

  def create
    @recipe = Recipe.new(
      title: params[:body_title],
      chef: params[:body_chef],
      ingredients: params[:body_ingredients],
      directions: params[:body_directions],
      prep_time: params[:body_prep_time],
      user_id: current_user.id
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

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "Recipe successfully destroyed!"}
  end
end
