class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness:true
  # before_destroy


end
