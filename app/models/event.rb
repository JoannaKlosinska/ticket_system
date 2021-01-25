class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true

  has_many :tickets
end
