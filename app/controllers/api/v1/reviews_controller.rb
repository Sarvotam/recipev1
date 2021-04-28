class Api::V1::ReviewsController < ApplicationController

  before_action :find_recipe
	before_action :find_review, only: [:show, :update, :destroy]

    def index
        @reviews = Review.all
        render json: @reviews
    end

    def create
      @review = @recipe.reviews.new(review_params)
      @reviews = @recipe.reviews
      if @review.save
        render json: {review: @review, status: :created, recipe: @recipe, reviews: @reviews}
      else
        render json: { errors: @review.errors }, status: :unprocessable_entity
      end
    end
    
    private

    def review_params
        params.permit(:rating, :comment, :recipe_id, :user_id)
    end
    
    def find_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def find_review
		@review = Review.find(params[:id])
	end
    
    
end
