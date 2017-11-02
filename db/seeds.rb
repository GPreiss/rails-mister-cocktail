require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
puts "creating ingredients..."
drinks = user["drinks"]
drinks.each do |ing|
  Ingredient.create!(name: [ing.values.first])
end
puts "finished!"
