require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
fixtures :users

    describe "#create" do
    let(:create_user) { post :create , :params => { :session => { :email => user.email } } }

    context "when current user is not admin" do
      let(:user) { users(:lilly) }
      it "will log in as user" do
        expect(create_user).to redirect_to :controller=>"addresses", :action => :index, :user_id => user.id
      end
    end

    context "when current user is admin" do
      let(:user) { users(:sam) }
      it "will log in as admin" do
        expect(create_user).to redirect_to admin_users_path
      end
    end
  end

  describe "#destroy" do
    let(:user) { users(:lilly) }
    let(:destroy_user) { delete :destroy, :params => { :session => {:user_id => user.id } } }

    it "will log out the user" do
      expect(destroy_user).to redirect_to root_path
    end
  end

end
