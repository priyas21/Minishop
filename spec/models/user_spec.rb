require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(:first_name => first_name, :last_name => last_name, :email => email) }
  let(:first_name) { "Priya" }
  let(:last_name) { "Sodhi" }
  let(:email) { "p@example.com" }
  context "without first name" do
    let(:first_name) { nil }

      it "is not valid" do
      expect(user).to_not be_valid
    end
  end

   context "without last name" do
    let(:last_name) { nil }

      it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "without an email" do
    let(:first_name) { "Priya" }
    let(:email) { " " }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end
  context "with invalid email address" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz...com]

    it "is not valid" do
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end
  end

  context "with valid email address" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]

    it "is valid" do
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  context "with duplicate email address" do
    let!(:duplicate_user) { User.create!(:first_name => first_name,:last_name => last_name, :email => email ) }


    it "is not valid" do
      expect(user).to_not be_valid
    end
  end
end
