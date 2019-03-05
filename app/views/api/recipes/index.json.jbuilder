json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.chef recipe.chef
  json.prep_time recipe.prep_time
  json.ingredients recipe.ingredients_list
  json.directions recipe.directions_list
  json.created_at recipe.friendly_created_at
  json.friendly_prep_time recipe.friendly_prep_time
end
