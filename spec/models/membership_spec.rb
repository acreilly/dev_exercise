require 'rails_helper'

RSpec.describe Membership, type: :model do

  describe 'associations' do
    it { should belong_to(:organization) }
    it { should belong_to(:user) }
  end
end
