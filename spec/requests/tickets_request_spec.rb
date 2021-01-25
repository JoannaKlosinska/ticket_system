require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  # index
  # 1. route: '/events/1/tickets'
  # 2. response: { count: 120 }, status_code: 200
  # 3. w akcji:
  #   - event = Event.find(params[:event_id])
  #   - event.tickets.count --> 120
  fixtures(:events, :users)

  describe 'GET #index' do
    context 'when event exists' do
      let(:event) { events(:one) }
      let(:user) { users(:mike) }
      let(:tickets) { 
         120.times { Ticket.create(price: 1234567890.50, event_id: event.id, user_id: user.id) } 
      }

      before do
        get "/events/#{event.id}/tickets"
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns all tickets' do
        expect(tickets).to eq 120
      end
    end
    context 'when event does not exists' do

      before do
        get "/events/1/tickets"
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      # it 'does not return any tickets' 
    end
  end

end
