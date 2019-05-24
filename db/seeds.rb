require 'json'
require 'open-uri'

URL = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'.freeze

ingredients_list = open(URL).read

puts 'Creating your ingredients...'

ingredients = JSON.parse(ingredients_list)

list = ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "Created #{list.count} ingredients!"
