require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) { User.create!(:first_name => first_name, :last_name => last_name, :phone => phone, :email => email) }

  describe "#new" do
    context "when initialized" do
      before { get :new }

      it "is a new user" do
       expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "#create" do
    subject(:create_user) { post :create, :params => user_params }
    let(:user_params) { { :user => {:first_name => first_name, :last_name => last_name, :phone => phone, :email => email } } }
    let(:first_name) { "Priya" }
    let(:last_name) { "Sodhi" }
    let(:phone) { "0226258409" }
    let(:email) { "p@gmail.com" }

    context "valid attributes" do

      it "creates a user" do
        expect{create_user}.to change{User.count}.by(1)
      end
      it "redirects to show template" do
      expect(create_user).to redirect_to :action => :show, :id => assigns(:user).id
      end
      it "flashes a success message" do
      expect(create_user.request.flash[:success]).to_not be_nil
      end
    end

    context "invalid attributes" do
      let(:first_name) { nil }
      let(:phone) { "abc7786876"}
      let(:email) {'sg.com'}

      it "will not create a user" do
      expect{create_user}.to change{User.count}.by(0)
      end
      it "renders new template" do
      expect(create_user).to render_template(:new)
      end
      it "flashes a fail message" do
      expect(create_user.request.flash[:danger]).to_not be_nil
      end
    end
  end
end
