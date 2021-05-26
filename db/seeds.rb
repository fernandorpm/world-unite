User.create!(name: 'fernando')
User.create!(name: 'johnson')

Category.create!(name: 'The Americas', priority: 1)
Category.create!(name: 'Africa', priority: 1)
Category.create!(name: 'Asia', priority: 1)
Category.create!(name: 'Europe', priority: 1)
Category.create!(name: 'Oceania', priority: 1)
Category.create!(name: 'Antarctica', priority: 1)

Category.first.articles.create!(author_id: 1, title: "Canada is elected the best place to live in 2021", text: "Thats right! Canada was elected by the world as the best place t
  o live in 2021! Really cool isnt it", image: "this_is_an_image.jpeg")