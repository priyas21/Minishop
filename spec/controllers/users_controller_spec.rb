require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) { User.create!(:first_name => first_name, :last_name => last_name, :phone => phone, :email => email) }
  let(:first_name) { "Priya" }
  let(:last_name) { "Sodhi" }
  let(:phone) { "0226258409" }
  let(:email) { "p@gmail.com" }
  describe "#new" do
    context "when initialized" do
      before { get :new }

      it "is a new user" do
       expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

end
