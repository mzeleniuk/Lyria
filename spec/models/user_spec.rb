require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:rooms).dependent(:destroy) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
  end
end
