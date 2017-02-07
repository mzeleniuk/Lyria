require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(100).with_message('is too long (maximum is 100 characters)') }
  end
end
