require 'rails_helper'

RSpec.describe "Users", type: :request do
  fixtures(:users)

  describe 'GET #show' do
    context 'when user exists' do
      let(:user) { users(:mike) }
      before do
        get("/users/#{user.id}", headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns user details' do
        expect(json['name']).to eq 'Mike User'
        expect(json['email']).to eq 'mike@user.com'
      end
    end

    context 'when user does not exist' do
      let(:user) { users(:mike) }
      before do
        get("/users/1", headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST #create' do
    context 'create a user with valid attributes' do
      let(:user_params) { { name: 'User', email: 'user@mail.org', password: 'password' } }  

      it 'returns status code 201' do
        post("/users", params: { user: user_params })
        expect(response).to have_http_status(201)
      end

      it 'user created' do
        expect { post("/users", params: { user: user_params }) }.to change(User, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'update a user with valid attributes' do
      let(:user) { users(:mike) }
      let(:user_params) { { name: 'User User' }}
      before do
        put("/users/#{user.id}", params: { user: user_params }, headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
      it 'updates the user' do
        expect(response.body).to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { users(:mike) }
    before do
      delete("/users/#{user.id}", headers: { 'Authorization' => auth_token(user) })
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
