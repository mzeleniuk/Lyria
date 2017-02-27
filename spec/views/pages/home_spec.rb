require 'rails_helper'

RSpec.describe 'pages/home', type: :view do
  it 'renders home page' do
    render

    expect(rendered).to match('Welcome to <strong>Lyria</strong>')
    expect(rendered).to match('A place for <em>unlimited</em> chatting')
    expect(rendered).to match('Mobile version is available')
  end
end
