require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(:first_name => first_name, :last_name => last_name, :phone => phone, :email => email) }
  let(:first_name) { "Priya" }
  let(:last_name) { "Sodhi" }
  let(:phone) { "0226258409" }
  let(:email) { "p@example.com" }

  context "with valid attributes" do

      it "is valid" do
      expect(user).to be_valid
    end
  end

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

   context "without contact phone" do
    let(:phone) { nil }

      it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "without an email" do
    let(:email) { " " }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "with first name too long" do
    let(:first_name) { "p" * 51 }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

   context "with last name too long" do
    let(:last_name) { "s" * 51 }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "with invalid phone number" do
    invalid_phone_numbers = %w[shds23567 @9676000]

    it "is not valid" do
      invalid_phone_numbers.each do |invalid_phone_number|
        user.phone = invalid_phone_number
        expect(user).to_not be_valid
      end
    end
  end

   context "with valid phone number" do
    valid_phone_numbers = %w[+645678909 0226258409 ]

    it "is valid" do
      valid_phone_numbers.each do |valid_phone_number|
        user.phone = valid_phone_number
        expect(user).to be_valid
      end
    end
  end

  context "with phone number too long" do
    let(:phone) { "1" * 16 }

    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "with email too long" do
    let(:email) { "a" * 244 + "@example.com" }

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
    let!(:duplicate_user) { User.create!(:first_name => first_name,:last_name => last_name, :phone => phone, :email => email ) }


    it "is not valid" do
      expect(user).to_not be_valid
    end
  end

  context "with email address as uppercase or mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.com" }

    before do
      user.email = mixed_case_email
      user.save
      # byebug
    end

    it "will be saved in the database as lowercase" do
      # expect(user.email).to eq 'fOO@example.com'
      expect(user.reload.email).to eq mixed_case_email.downcase
    end
  end

end
