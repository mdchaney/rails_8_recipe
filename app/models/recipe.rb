class Recipe < ApplicationRecord
  has_one_attached :image

  normalizes :name, with: -> name { name.strip.downcase.unicode_normalize }
  normalizes :ingredients, with: -> ingredients { ingredients.strip.downcase.unicode_normalize }
  normalizes :instructions, with: -> instructions { instructions.strip.downcase.unicode_normalize }

  belongs_to :user
end
