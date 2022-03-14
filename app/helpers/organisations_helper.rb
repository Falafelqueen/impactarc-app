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
      url = "https://app.zipcodebase.com/api/v1/search?apikey=68f86710-a399-11ec-9175-99205e7cb76d&codes=10005%2C51503"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      return "#{@street},#{@city},#{@zip_code},#{country}"
    end

  end

end
