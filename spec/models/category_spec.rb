require 'rails_helper'

# Test suite for the Category model
RSpec.describe Category, type: :model do
  it { should have_many(:products).dependent(:destroy) }

  it { should validate_presence_of(:name) }
end