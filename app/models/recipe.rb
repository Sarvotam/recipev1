class Recipe < ApplicationRecord
	belongs_to :user
	has_many :category, through: :categories
	# has_many :reviews, dependent: :destroy
	# has_one_attached :image

	# has_many :ingredients, dependent: :destroy
	# accepts_nested_attributes_for :ingredients, allow_destroy: true

	# has_many :steps, dependent: :destroy
	# accepts_nested_attributes_for :steps, allow_destroy: true
end
