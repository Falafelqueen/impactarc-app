require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PagesHelper, type: :helper do

  describe "full_title" do
    it "should include the page title" do
      expect(full_title("foo").to match(/foo/))
    end
    it "should include the base title" do
      expect(full_title("foo").to match(/^ImpactArc/))
    end
    it "should not include a bar for the home page" do
      expect(full_title("foo")).to match(/\|/)
    end
  end
end
