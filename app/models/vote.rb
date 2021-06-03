class Vote < ApplicationRecord
  validates :user_id, :article_id, presence: true

  belongs_to :user, foreign_key: :user_id
  belongs_to :article, foreign_key: :article_id

  def self.already_voted(user_id, article_id)
    return !where(user_id: user_id, article_id: article_id).first.nil?
  end

end
