require 'rails_helper'

RSpec.describe Organization, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:memberships) }
    it { should have_many(:users).through(:memberships) }
  end

  it "is valid with a name and description" do
    organization = FactoryBot.build(:organization)
    expect(organization).to be_valid
  end

  describe '#search' do
    let(:query) { nil }
    let!(:organization) { create(:organization) }
    let!(:organization2) { create(:organization, name: 'A Org 2') }
    subject { Organization.search(query) }

    it 'should return all organizations when there is no query' do
      expect(subject).to include(organization)
      expect(subject).to include(organization2)
    end

    it 'should be in alphabetical order' do
      expect(subject.first).to eq(organization2)
    end

    context 'with a query' do
      let(:query) { 'A O' }

      it 'should return organization with similar name' do
        expect(subject.count).to eq(1)
        expect(subject).to include(organization2)
      end
    end
  end
end
