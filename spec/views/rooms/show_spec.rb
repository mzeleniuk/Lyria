require 'rails_helper'

RSpec.describe 'rooms/show', type: :view do
  let(:user) { create :user, :confirmed }
  let(:room) { create :room, user: user }
  let(:message) { create :message, room: room, user: user }

  it 'renders show partial' do
    assign(:room, room)
    assign(:messages, [message])
    render

    expect(rendered).to match(room.title)
    expect(rendered).to match(message.body)
  end
end
