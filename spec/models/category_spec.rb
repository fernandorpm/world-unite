require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'is associated to article' do
    it { should have_many(:articles) }
  end

  describe 'is valid with valid attributes' do
    # name
    it { should validate_presence_of(:name) }
    it {
      should validate_length_of(:name)
        .is_at_most(30)
    }

    # priority
    it { should validate_presence_of(:priority) }
  end
end
