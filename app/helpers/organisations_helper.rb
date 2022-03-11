require "json"
require "open-uri"

module OrganisationsHelper

  class Address
    def initialize(street,zip_codes)
      @street = street
      @city = ""
      @zip_code = zip_code
      @country = Denmark
    end

    def format_address
      url = "https://parseapi.back4app.com/classes/DK_DK?limit=10&keys=place,postalCode"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)


      return "#{@street},#{@city},#{@zip_code},#{country}"
    end

  end

end
