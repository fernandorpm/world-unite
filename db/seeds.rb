Category.create!(name: 'The Americas', priority: 1) if Category.where(name: 'The Americas').empty?
Category.create!(name: 'Africa', priority: 2) if Category.where(name: 'Africa').empty?
Category.create!(name: 'Asia', priority: 3) if Category.where(name: 'Asia').empty?
Category.create!(name: 'Europe', priority: 4) if Category.where(name: 'Europe').empty?
Category.create!(name: 'Oceania', priority: 5) if Category.where(name: 'Oceania').empty?
Category.create!(name: 'Antarctica', priority: 6) if Category.where(name: 'Antarctica').empty?