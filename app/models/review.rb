class Review < ApplicationRecord
  STARS = [0, 1, 2, 3, 4, 5]
  belongs_to :cocktail

  validates :content, presence: true
  validates :stars, inclusion: { in: STARS }, presence: true
end
