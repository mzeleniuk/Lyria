require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:rooms).dependent(:destroy) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
  end

  describe '.name' do
    let(:user) { create :user, :confirmed, email: 'james@mail.com' }

    it 'extracts a name from email' do
      expect(user.name).to eq('james')
    end
  end
end
