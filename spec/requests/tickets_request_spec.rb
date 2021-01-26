require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  fixtures(:events, :users)

  describe 'GET #index' do
    let(:user) { users(:mike) }

    context 'when event exists' do
      let(:event) { events(:one) }
      let(:tickets) { 
        120.times { Ticket.create(price: 1234567890.50, event_id: event.id, user_id: nil) } 
      }

      before do
        get("/events/#{event.id}/tickets", headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns ticket count' do
        expect(tickets).to eq 120
      end
    end

    context 'when event does not exists' do
      before do
        get("/events/1/tickets", headers: { 'Authorization' => auth_token(user) })
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
    # context 'where there is no available tickets '
  end
end
