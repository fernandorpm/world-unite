class Article < ApplicationRecord
  include ActionView::Helpers::TextHelper
  
  validates :title, :text, :image, presence: true
  validates :title, length: { in: 8..100 }
  validates :text, length: { in: 50..5000 }

  belongs_to :author, foreign_key: 'author_id', class_name: 'User'

  has_one_attached :image, dependent: :destroy

  has_many :votes, foreign_key: 'article_id'

  has_many :article_categories, class_name: 'ArticleCategory'
  has_many :categories, through: :article_categories, class_name: 'Category', dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true

  scope :most_voted, -> {
    if Vote.count > 0
      joins(:votes)
        .group(:article_id, :id)
        .order('COUNT(votes.article_id) desc')
        .first
    else
      order('created_at desc').first
    end
  }

  def mini_text
    truncate(text, :length => 47)
  end

end
