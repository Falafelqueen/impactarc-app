require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject { page }
  describe "singup page" do
    before do
      visit signup_path
    end

    it { should have_content('Sign up')}
    it { should have_title(full_title('Sign up')) }
  end
end
