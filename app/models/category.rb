class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20 }, uniqueness: true
  validates :priority, presence: true

  has_many :article_categories, class_name: 'ArticleCategory'
  has_many :articles, through: :article_categories, class_name: 'Article', dependent: :destroy

  has_many :articles_from_the_americas, lambda {
                                                  where category_id: 1
                                                }, foreign_key: :category_id, class_name: 'ArticleCategory', dependent: :destroy
  has_many :american_articles, through: :articles_from_the_americas, source: :article, dependent: :destroy

  has_many :articles_from_africa, lambda {
                                          where category_id: 2
                                        }, foreign_key: :category_id, class_name: 'ArticleCategory', dependent: :destroy
  has_many :african_articles, through: :articles_from_africa, source: :article, dependent: :destroy

  has_many :articles_from_asia, lambda {
                                        where category_id: 3
                                      }, foreign_key: :category_id, class_name: 'ArticleCategory', dependent: :destroy
  has_many :asian_articles, through: :articles_from_asia, source: :article, dependent: :destroy

  has_many :articles_from_europe, lambda {
                                          where category_id: 4
                                        }, foreign_key: :category_id, class_name: 'ArticleCategory', dependent: :destroy
  has_many :european_articles, through: :articles_from_europe, source: :article, dependent: :destroy

  has_many :articles_from_oceania, lambda {
                                            where category_id: 5
                                          }, foreign_key: :category_id, class_name: 'ArticleCategory', dependent: :destroy
  has_many :oceanian_articles, through: :articles_from_oceania, source: :article, dependent: :destroy

  has_many :articles_from_antarctica, lambda {
                                                where category_id: 6
                                              }, foreign_key: :category_id, class_name: 'ArticleCategory', dependent: :destroy
  has_many :antarctican_articles, through: :articles_from_antarctica, source: :article, dependent: :destroy
end
