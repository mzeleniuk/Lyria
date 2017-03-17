require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:user) { create :user, :confirmed }

  describe '#gravatar_for' do
    it 'returns the proper image' do
      expect(helper.gravatar_for(user)).to match("img alt=\"#{user.username}\" src=\"https://www.gravatar.com/avatar/")
    end
  end

  describe '#bootstrap_class_for' do
    it 'returns the correct success type' do
      expect(helper.bootstrap_class_for('success')).to eq('alert-success')
    end

    it 'returns the correct error type' do
      expect(helper.bootstrap_class_for('error')).to eq('alert-danger')
    end

    it 'returns the correct alert type' do
      expect(helper.bootstrap_class_for('alert')).to eq('alert-warning')
    end

    it 'returns the correct notice type' do
      expect(helper.bootstrap_class_for('notice')).to eq('alert-info')
    end
  end
end
