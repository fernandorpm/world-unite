User.create!(name: 'fernando')
User.create!(name: 'johnson')

Category.create!(name: 'The Americas', priority: 1)
Category.create!(name: 'Africa', priority: 2)
Category.create!(name: 'Asia', priority: 3)
Category.create!(name: 'Europe', priority: 4)
Category.create!(name: 'Oceania', priority: 5)
Category.create!(name: 'Antarctica', priority: 6)

# Category.find(1).articles.create!(author_id: 1, title: "Canada is elected the best place to live in 2021", text: "Thats right! Canada was elected by the world as the best place t
#   o live in 2021! Really cool isnt it", image: "this_is_an_image.jpeg")

# Category.find(2).articles.create!(author_id: 2, title: "Uganda is elected the best place to live in 2021", text: "Thats right! Uganda was elected by the world as the best place t
#   o live in 2021! Really cool isnt it", image: "this_is_an_image.jpeg")

# Vote.create!(user_id: 1, article_id: 1)
# Vote.create!(user_id: 2, article_id: 1)

# Vote.create!(user_id: 1, article_id: 2)
