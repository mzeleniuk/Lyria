require 'rails_helper'

RSpec.describe MessagesHelper, type: :helper do
  describe '#markdown_to_html' do
    it 'returns the HTML formatted text' do
      expect(helper.markdown_to_html('**Test**')).to match('<p><strong>Test</strong></p>')
      expect(helper.markdown_to_html('*Test*')).to match('<p><em>Test</em></p>')
      expect(helper.markdown_to_html('`Test`')).to match('<p><code>Test</code></p>')
    end
  end
end
