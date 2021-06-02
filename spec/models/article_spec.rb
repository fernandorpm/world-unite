require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'is associated to user, categories, votes, and images' do
    it { should belong_to(:author) }
    it { should have_many(:categories).through(:article_categories).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_one_attached(:image) }
  end

  describe 'is valid with valid attributes' do
    # title
    it { should validate_presence_of(:title) }
    it {
      should validate_length_of(:title)
        .is_at_most(100)
    }

    # text
    it { should validate_presence_of(:text) }
    it {
      should validate_length_of(:text)
        .is_at_most(5000)
    }
  end
end
