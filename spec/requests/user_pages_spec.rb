require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject { page }

  describe "singup page" do
    before do
      visit signup_path
    end

    it { is_expected.to have_content('Sign up')}
    it { is_expected.to have_title(full_title('Sign up')) }
  end

  describe "sign up" do
    before do
      visit signup_path
    end
    let(:submit) { "Create account"}

    describe "with valid information" do
      it "doesn`t create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      let(:user) { build(:user) }
      before do
        fill_in "Name", with: user.name
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        fill_in "Confirm password", with: user.password_confirmation
      end

      it "creates a user" do

       expect { click_button submit}.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    let(:user) { create(:user) }

    before do
      visit user_path(user)
    end

    it { is_expected.to have_content(user.name)}
    it { is_expected.to have_title(user.name)}
  end
end
