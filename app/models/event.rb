class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true

  has_many: tickets, dependent: :destroy
end
