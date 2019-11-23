require 'open-uri'
require 'json'
Dose.destroy_all
Ingredient.destroy_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
repo = open(url).read()
ending = JSON.parse(repo)
e = ending.flatten[1]
e.each do |item|
  cocktail = Ingredient.create!(
    name: item['strIngredient1']
  )
end
