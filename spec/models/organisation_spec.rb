require 'rails_helper'

RSpec.describe Organisation do

  context 'newly created' do
    let!(:category){Category.create(name: "Environment")}
    let!(:organisation){FactoryBot.create(:organisation)}

    before do
      OrganisationCategory.create(category: category, organisation: organisation)
    end

    it 'has a name' do
      org2 = build(:organisation, name: nil)
      expect(organisation.name).to eql(organisation.name)
      expect(organisation).to be_valid
      expect(org2).not_to be_valid
    end

    it 'has a unique name' do
      org2 = build(:organisation)
      expect(organisation).to be_valid
      expect(org2).not_to be_valid
    end

    it 'has a description' do
      org2 = build(:organisation, name: "Unique name", description: nil)
      expect(organisation.description).not_to be_nil
      expect(org2).not_to be_valid
    end


    it 'belongs to at least one existing category' do
      puts Category.all
      puts OrganisationCategory.all
      org_category = organisation.category_ids
      expect(org_category).not_to be_nil
    end

    it 'has associated tags' do
      org2 = build(:organisation, name: "Unique name", tags: [])
      expect(organisation.search_words).to exist
      expect(org2).not_to be_valid
    end
    it 'has a valid address' do
      copenhagen_zip_codes = ['2000', '2100', '2150', '2200', '2300', '2400','2450']
      city = ["Copenhagen", "København", 'Hvidorve', 'Glostrup', 'Hellerup']
      country = ["Denmark", 'Danmark']
      address_array = organisation.address.split(',')
      valid_address = if city.include?(address_array[1]) && copenhagen_zip_codes.include?(address_array[2]) && country.include?(address_array[3])
        true
      end
      expect(valid_address).to be true
    end

    it 'has a valid email address' do
      valid_email_format = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/
      org2 = build(:organisation, name: "Unique name", email: "wrong@example")
      expect(organisation.email).to match(valid_email_format)
      expect(org2).not_to be_valid
    end

  end
end
