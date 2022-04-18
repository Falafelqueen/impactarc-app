require 'rails_helper'

RSpec.describe User, type: :model do


  context "valid" do
    subject(:user) { build(:user) }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password_digest) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:password_confirmation) }
    it { is_expected.to respond_to(:authenticate) }

    it { is_expected.to be_valid }

    it "has email in a valid format" do
      email_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      email_addresses.each do |valid_email|
        user.email = valid_email
        expect(user).to be_valid
      end
    end
  end

  context "invalid" do
    let(:user) { create(:user, email: "original@mail.com")}

    it "leaves name field empty" do
      no_name_user = build(:user, name: "")
      expect(no_name_user).not_to be_valid
    end

    it "has a name too long" do
      long_name_user = build(:user, name: ("a" * 21))
      expect(long_name_user).not_to be_valid
    end

    it "leaves email field empty" do
      no_email_user = build(:user, email: "")
      expect(no_email_user).not_to be_valid
    end

    it "has invalid email format" do
      wrong_email_user = build(:user, email: "email.email.com")
      expect(wrong_email_user).not_to be_valid
    end

    it "has email that already exists" do
      user
      duplicate_email_user = build(:user, email: "original@mail.com")

      expect(duplicate_email_user).not_to be_valid
    end
    it "leaves password blank" do
      no_password_user = build(:user, password: "", password_confirmation: "")

      expect(no_password_user).not_to be_valid
    end

    it "choses a very short password" do
      user.password = user.password_confirmation = "a" * 5
      short_password_user = user
      expect(short_password_user).not_to be_valid
    end

    it "enters mismatching password confirmation" do
      mismatch_password_user = build(:user, password_confirmation: "mismatch")

      expect(mismatch_password_user).not_to be_valid
    end


    describe "return value of authenticate" do
      let(:found_user) { User.find_by(email: user.email) }

      describe "with valid password" do
        it "authenticates the user" do
          expect(user).to eq(found_user.authenticate(user.password))
        end
      end
      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid")}

        it "is false" do
          expect(user).not_to eq(user_for_invalid_password)
          expect(user_for_invalid_password).to be(false)
        end
      end
    end
  end

end
