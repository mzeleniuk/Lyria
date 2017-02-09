require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:user) { create :user, :confirmed }

  describe 'GET #index' do
    context 'when user is authenticated' do
      before { sign_in user }

      it 'returns http success' do
        get :index

        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to login page' do
        get :index

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is authenticated' do
      before { sign_in user }

      it 'returns http success' do
        get :new

        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to login page' do
        get :new

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is authenticated' do
      before { sign_in user }

      context 'with valid room params' do
        it 'creates a new Room' do
          post :create, params: {room: {title: 'Title', description: 'Description'}, user: user}

          expect(Room.count).to eq(1)
        end

        it 'redirects to rooms path' do
          post :create, params: {room: {title: 'Title', description: 'Description'}, user: user}

          expect(response).to redirect_to(rooms_path)
        end

        it 'shows correct flash message' do
          post :create, params: {room: {title: 'Title', description: 'Description'}, user: user}

          expect(flash[:success]).to eq('Chat room added!')
        end
      end

      context 'with invalid room params' do
        it 'does not creates a new Room' do
          post :create, params: {room: {title: nil, description: 'Description'}, user: user}

          expect(Room.count).to eq(0)
        end
      end
    end

    context 'when user is not authenticated' do
      context 'with valid room params' do
        it 'redirects to login page' do
          post :create, params: {room: {title: 'Title', description: 'Description'}, user: user}

          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'with invalid room params' do
        it 'redirects to login page' do
          post :create, params: {room: {title: nil, description: 'Description'}, user: user}

          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end
