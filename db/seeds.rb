require 'json'
require 'open-uri'
Ingredient.destroy_all
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
puts "creating ingredients..."
drinks = user["drinks"]
drinks.each do |ingredient_hash|
  Ingredient.create!(name: ingredient_hash["strIngredient1"])
end
puts "finished!"
