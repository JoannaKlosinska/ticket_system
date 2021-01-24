class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    json_response(@event)
  end

end
