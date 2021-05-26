class Article < ApplicationRecord
  validates :author_id, :title, :text, :image, presence: true
  validates :title, length: { in: 8..100 }
  validates :text, length: { in: 50..2000 }

  belongs_to :author, foreign_key: 'author_id', class_name: 'User'

  has_many :article_categories, class_name: 'ArticleCategory'
  has_many :categories, through: :article_categories, class_name: 'Category', dependent: :destroy

end
