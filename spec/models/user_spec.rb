require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:memberships) }
    it { should have_many(:organizations).through(:memberships) }
  end

  it "is valid with a first_name, last_name, email and password" do
    user = User.new(first_name: "Robo", last_name: "Tron", email: "robotron@dundermifflin.com", password: "password", password_confirmation: "password")
    expect(user).to be_valid
  end

  it 'returns full name' do
    user = User.new(first_name: "Robo", last_name: "Tron", email: "robotron@dundermifflin.com", password: "password", password_confirmation: "password")

    expect(user.full_name).to eq('Robo Tron')
  end
end
