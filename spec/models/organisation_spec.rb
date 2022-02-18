require 'rails_helper'

RSpec.describe Organisation, :type => :model do
  context 'newly created' do

    before(:each) do
      @org = create(:organisation)
    end

    it 'has a name' do
      expect(@org.name).to eql(@org.name)
      expect(@org).to be_valid
    end

    it 'has a unique name' do
      org2 = build(:organisation)
      expect(@org).to be_valid
      expect(org2).not_to be_valid
    end

    it 'has a description' do
      expect(@org.description).not_to be_nil
    end

    it 'has associated tags' do
      expect(@org.tags.length).to be >= 1
    end

    it 'belongs to at least one existing category' do
      categories = ["Human Rights", "Environment", "Homeless"]
      existing_categories = []
      categories.each do |category|
        if @org.categories.include?(category) ||  @org.categories.include?(category.downcase)
           existing_categories << category
        end
      end
      expect(existing_categories.length).to be >= 1
    end

    it 'has a valid address' do
      copenhagen_zip_codes = ['2000', '2100', '2150', '2200', '2300', '2400','2450']
      city = ["Copenhagen", "København", 'Hvidorve', 'Glostrup', 'Hellerup']
      country = ["Denmark", 'Danmark']
      address_array = @org.address.split(',')
      valid_address = if city.include?(address_array[1]) && copenhagen_zip_codes.include?(address_array[2]) && country.include?(address_array[3])
        true
      end
      expect(valid_address).to be true
    end
  end
end
