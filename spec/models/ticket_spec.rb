require 'rails_helper'

RSpec.describe Ticket, type: :model do
  # Association tests
  it { should belong_to(:event) }
  # Validation tests
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:event_id) }
  it { should validate_presence_of(:user_id) }
end
