require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'is associated to user and article' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
