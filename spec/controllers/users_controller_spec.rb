require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  fixtures :users, :addresses

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

  describe "#show" do
    let!(:user) { users(:lilly) }
    let(:show_user) {get :show, :params => user_id }
    let(:user_id) { { :id => user.id } }
    before do
      user
      session[:user_id] = user.id
    end

    it "will render the show template of user " do
      expect(show_user).to render_template(:show)
    end
  end

  describe "#edit" do
   let!(:user) { users(:lilly) }
   let(:edit_user) { get :edit , :params => user_id }
   let(:user_id) { { :id => user.id  } }

   before(:each) do
    user
    session[:user_id] = user.id
   end

   it "will alllow the user to edit their perosnal details" do
    expect(edit_user).to render_template(:edit)
   end
  end

  describe "#update" do
    let!(:user) { users(:lilly) }
    let!(:address) { addresses(:first_property) }
    let(:update_user) { patch :update, :params => user_params }
    before(:each) do
      user
      session[:user_id] = user.id
    end

    context "with valid attributes" do
      let(:user_params) { { :id => user.id , :user => { :first_name => 'Lillyy',
                          :last_name => 'S', :phone => '11111',
                          :email => 'lilly@example.com' } } }
      it "will flashes successfull message" do
        expect(update_user.request.flash[:success]).to_not be_nil
      end

      it "will redirect to show page" do
        expect(update_user).to redirect_to("/users/#{ assigns(:user).id }/addresses/#{ assigns(:address).id }")
      end
    end

    context "with invalid attributes" do
      let(:user_params) { { :id => user.id , :user => { :first_name => 'Lillyy',
                          :last_name => '', :phone => '11111',
                          :email => 'lill876876y' } } }

      it "will render the edit page" do
        expect(update_user).to render_template(:edit)
      end
    end
  end
end
