class Category < ApplicationRecord
    has_many :recipes, through: :recipes
end
