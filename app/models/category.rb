class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20 }, uniqueness: true
  validates :priority, presence: true

  has_many :article_categories
  has_many :articles, through: :article_categories
end
