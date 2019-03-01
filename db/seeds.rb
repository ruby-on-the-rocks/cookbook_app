puts "Start seed"
recipe1 = Recipe.new(title: "Mud Pie", chef: "Peter Jang", prep_time: 10, ingredients: "Mud", directions: "Eat the mud")
recipe1.save
recipe2 = Recipe.new(title: "PB Cookie", chef: "Peter Jang", prep_time: 30, ingredients: "Peanut butter, 1 egg, 1 cup of brown sugar", directions: "Mix, bake")
recipe2.save
puts "End seed"
