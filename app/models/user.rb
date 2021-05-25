class User < ApplicationRecord
  validates :name, presence: true, length: { in: 6..20 }, uniqueness: true
end
