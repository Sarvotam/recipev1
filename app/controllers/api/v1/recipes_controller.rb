class Api::V1::RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
        render json: @recipe
    end

    def create
        @recipe = Recipe.create(recipe_params)

    end

    private
    def recipe_params
        params.permit(:view_count, :description, :title, :category_id, :user_id)
    end
    
    
    
end
