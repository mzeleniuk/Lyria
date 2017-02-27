require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { create :user, :confirmed }

  describe 'GET #home' do
    context 'when user is authenticated' do
      before { sign_in user }

      it 'returns http success' do
        get :home

        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not authenticated' do
      it 'returns http success' do
        get :home

        expect(response).to have_http_status(:success)
      end
    end
  end
end
