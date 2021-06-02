class Vote < ApplicationRecord
  validates :user_id, :article_id, presence: true

  belongs_to :user, foreign_key: :user_id
  belongs_to :article, foreign_key: :article_id
end
