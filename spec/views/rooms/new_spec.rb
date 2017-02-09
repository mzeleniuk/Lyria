require 'rails_helper'

RSpec.describe 'rooms/new', type: :view do
  it 'displays the Room form' do
    assign(:room, Room.new)
    render

    expect(rendered).to match('Add chat room')
    expect(rendered).to match('Title')
    expect(rendered).to match('Description')
  end
end
