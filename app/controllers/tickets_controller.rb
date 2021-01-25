class TicketsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @tickets = @event.tickets.count
    json_response(@tickets)
  end

  def create
  end
end
