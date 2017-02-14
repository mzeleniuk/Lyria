require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:user) { create :user, :confirmed }

  describe '#gravatar_for' do
    it 'returns the proper image' do
      expect(helper.gravatar_for(user)).to match("<img alt=\"#{user.name}\" src=\"https://www.gravatar.com/avatar/66553b05642bc3c2d23a4a07c7f7c6d1?s=40\" />")
    end
  end
end
