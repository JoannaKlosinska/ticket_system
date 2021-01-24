require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  # index
  # 1. route: '/events/1/tickets'
  # 2. response: { count: 120 }, status_code: 200
  # 3. w akcji:
  #   - event = Event.find(params[:event_id])
  #   - event.tickets.count --> 120
end
