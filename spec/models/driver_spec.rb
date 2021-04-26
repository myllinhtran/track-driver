require 'rails_helper'

# Test suite for Driver model
RSpec.describe Driver, type: :model do

  # Association test
  # ensure Driver model has a 1:m relationship with the Checkin model
  it { should have_many(:checkins).dependent(:destroy) }

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }

end