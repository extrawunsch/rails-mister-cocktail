# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
ingredients = JSON.parse(list_serialized)
list = ingredients["drinks"].sort_by { |change| change }

puts "Cleaning database..."
Ingredient.destroy_all
sleep 1 

puts "Creating drinks..."
Cocktail.create(name: 'The Ultimate Whiskey Sour', image_url: 'https://images.unsplash.com/photo-1591634586875-a1e4b9725c94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
Cocktail.create(name: 'Gin Tonic Twist', image_url: 'https://images.unsplash.com/photo-1604321115296-f4b73745c7d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
Cocktail.create(name: 'Fizzy Basil Mojito', image_url: 'https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=600&q=60')
Cocktail.create(name: 'Quick Aperol Spritz', image_url: 'https://images.unsplash.com/photo-1560433956-b2847671bb86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=648&q=80')

list.each do |ingredient|
  zutat = Ingredient.create(name: ingredient["strIngredient1"])
end
sleep 2 
puts "Finished!"