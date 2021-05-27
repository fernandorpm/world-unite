class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20 }, uniqueness: true
  validates :priority, presence: true

  has_many :article_categories, class_name: 'ArticleCategory', foreign_key: :category_id
  has_many :articles, through: :article_categories, class_name: 'Article', dependent: :destroy

end
