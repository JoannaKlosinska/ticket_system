class TicketsController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    tickets = event.available_tickets.count
    json_response(tickets)
  end

  def create
    event = Event.find(params[:event_id])
    order_ticket_count = params[:ticket_count]
    available_tickets = event.available_tickets

    if available_tickets.size >= order_ticket_count
      tickets_to_be_bought = available_tickets.first(order_ticket_count)
      overall_price = tickets_to_be_bought.sum(:price)
      # now there should be a payment of overall_price and if it's a success,
      # then we set tickets_to_be_bought user_id to the authenticated user
      # but I don't know how to do this
    else
      json_response({ errors: 'Not enough tickets left' }, 400)
    end
  end
end
