class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority, default: 1

      t.timestamps
    end

    Category.create!(name: 'The Americas', priority: 1)
    Category.create!(name: 'Africa', priority: 2)
    Category.create!(name: 'Asia', priority: 3)
    Category.create!(name: 'Europe', priority: 4)
    Category.create!(name: 'Oceania', priority: 5)
    Category.create!(name: 'Antarctica', priority: 6)
  end
end
