class User < ApplicationRecord

  validates :name, presence: true, length: { in: 6..20 }, uniqueness: true

  has_many :articles, foreign_key: :author_id
  has_many :votes, foreign_key: :user_id

end
