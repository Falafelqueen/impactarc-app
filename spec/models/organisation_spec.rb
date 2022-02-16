require 'rails_helper'

RSpec.describe Organisation, :type => :model do
  context 'created new organisation' do
    it 'has a name' do
      org = FactoryBot.build(:organisation)
      expect(org.name).to eql(org.name)
      expect(org).to be_valid
    end

    it 'has a unique name' do
      org = build(:Organisation)
      org2 = build(:organisation)
      expect(org).to be_valid
      expect(org2).not_to be_valid
    end

    it 'has a description' do
      expect(org.description).not_to be_nil
    end
  end
end
