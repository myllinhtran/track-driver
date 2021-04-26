require 'rails_helper'

# Test suite for Checkin model
RSpec.describe Checkin, type: :model do

  # Association test
  # ensure Driver model has a 1:m relationship with the Checkin model
  it { should belong_to(:driver) }

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:hours) }
  it { should validate_presence_of(:driver_id) }

end