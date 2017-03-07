require 'rails_helper'

RSpec.describe 'rooms/index', type: :view do
  let(:user) { create :user, :confirmed }
  let(:first_room) { create :room, user: user }
  let(:second_room) { create :room, title: 'Angular', user: user }

  it 'renders _room partial for each room' do
    assign(:rooms, [first_room, second_room])
    render

    expect(rendered).to match('Chat rooms')
    expect(rendered).to match("#{first_room.title}")
    expect(rendered).to match("#{second_room.title}")
  end
end
