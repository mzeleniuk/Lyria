require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:room) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:room) }
  end

  describe '.timestamp' do
    let(:user) { create :user, :confirmed }
    let(:room) { create :room, user: user }
    let(:message) { create :message, user: user, room: room, created_at: DateTime.new(2016, 07, 11, 20, 10, 40) }

    it 'returns the formatted date' do
      expect(message.timestamp).to eq('20:10:40 11 July 2016')
    end
  end
end
