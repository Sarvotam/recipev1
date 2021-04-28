class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe
      render json: @recipe
    else
      render json: { error: "cannot create recipe"}
    end
  end

  private
  def recipe_params
    params.permit(:view_count, :description, :title, :category_ids[], :user_id)
  end
end
