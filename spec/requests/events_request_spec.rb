require 'rails_helper'

RSpec.describe 'Events', type: :request do
  fixtures(:events, :users)

  describe 'GET #show' do
    let(:user) { users(:mike) }

    context 'when event exists' do
      let(:event) { events(:one) }

      before do
        get("/events/#{event.id}", headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns object details' do
        expect(json['name']).to eq 'The Concert'
        expect(json['date'].to_datetime).to eq '2021-03-01 9:00'.to_datetime
      end
    end

    context 'when event does not exist' do
      before do
        get("/events/1", headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns expected error object' do
        expect(json['errors']).to eq 'Not found'
      end
    end
  end
end
