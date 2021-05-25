class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :author_id, null: false
      t.string :title
      t.text :text
      t.text :image

      t.timestamps
    end
  end
end
