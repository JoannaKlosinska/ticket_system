require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  fixtures(:users)
  let(:user) { users(:mike) }

  context 'login user with valid attributes' do
    before do
      post('/login', params: { email: 'mike@user.com', password: 'password' })
    end

    it 'returns success status' do
      expect(response).to have_http_status(200)
    end

    it 'returns token in the response' do
      expect(json).to have_key 'token'
    end
  end
  context 'login user with invalid attributes' do
    before do
      post('/login', params: { email: 'other@user.com', password: '123456' })
    end

    it 'returns unauthorized status' do
      expect(response).to have_http_status(401)
    end
  end
end
