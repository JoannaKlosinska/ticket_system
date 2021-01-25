require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association tests
  it { should have_many(:tickets) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date) }
end