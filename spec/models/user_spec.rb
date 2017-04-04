require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create :user, :confirmed }

  describe 'Associations' do
    it { is_expected.to have_many(:rooms).dependent(:destroy) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_most(50).with_message('is too long (maximum is 50 characters)') }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6).with_message('is too short (minimum is 6 characters)') }
    it { is_expected.to validate_length_of(:about_me).is_at_most(500).with_message('is too long (maximum is 500 characters)') }
  end
end
