require 'faker'

30.times do
  ingredient = Ingredient.new(
    name:    Faker::Food.ingredient
  )
  ingredient.save!
end


# 30.times do
#   ingredient = Ingredient.new(
#     name:    Faker::Food.spice
#   )
#   ingredient.save!
# end
