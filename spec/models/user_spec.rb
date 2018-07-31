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
end
