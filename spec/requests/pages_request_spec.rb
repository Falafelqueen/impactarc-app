require 'rails_helper'

RSpec.describe "Pages", type: :request do


  describe "Home page" do
    before { visit root_path}


    it "should have the base title " do
      expect(page).to have_title("ImpactArc")
    end

    it "should not have a custom page title" do
      expect(page).not_to have_title('| Home')
    end
  end
end
