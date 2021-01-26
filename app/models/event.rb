class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true

  has_many :tickets

  def available_tickets
    tickets.where(user_id: nil)
  end
end
