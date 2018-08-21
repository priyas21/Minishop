require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  fixtures :users, :addresses

  let!(:user) { User.create!(:first_name => first_name, :last_name => last_name, :phone => phone, :email => email) }
  let(:first_name) { "Priya" }
  let(:last_name) { "Sodhi" }
  let(:phone) { "0226258409" }
  let(:email) { "p@gmail.com" }

  describe "#index" do
   let!(:user) { users(:lilly) }
   let!(:address) { addresses(:first_property) }
   let(:show_addresses) { get :index, :params => user_id}
   let(:user_id) { { :user_id => user.id } }

   before { session[:user_id] = user.id }

    it "will display all the addresses of the user" do
      expect(show_addresses).to render_template(:index)
    end
  end

  describe "#show" do
   let!(:user) { users(:lilly) }
   let!(:address) { addresses(:first_property) }
   let(:show_address) { get :show, :params => address_params }
   let(:address_params) { { :user_id => user.id, :id => address.id } }

   before { session[:user_id] = user.id }

    it "will display the selected address of the user" do
      expect(show_address).to render_template(:show)
    end
  end

  describe "#create" do
    let(:create_address) { post :create, :params => address_params }
    let(:address_params) { { :address => { :address1 => address1, :address2 => address2, :city => city,
      :district => district, :suburb => suburb, :post_code => post_code, :icp_number => icp_number }, :user_id => user.to_param } }
    let(:address1) { "19A mahoe st" }
    let(:address2) { "" }
    let(:city) { "Wellington" }
    let(:district) { "Porirua" }
    let(:suburb) { "Tawa" }
    let(:post_code) { "1111" }
    let(:icp_number) { "12sdnkli54" }

    context "with valid attributes" do

      it "creates a new address" do
        expect{create_address}.to change{Address.count}.by(1)
      end
      it "redirects to addresses show template" do
        expect(create_address).to redirect_to :action => :show, :id => assigns(:address).id
      end
    end

    context "with invalid attributes" do
      let(:address1) { "" }
      let(:city) { "" }
      let(:district) { "" }
      let(:suburb) { "" }
      let(:post_code) { "" }

      it "will not create an address" do
        expect{create_address}.to change{Address.count}.by(0)
      end
      it "will show the user the error" do
        expect(create_address.request.flash[:danger]).to_not be_nil
      end
    end
  end

  describe "#update" do
    let!(:user) { users(:lilly) }
    let!(:address) { addresses(:first_property) }
    let(:update_user_address) { patch :update, :params => address_params }
    let(:address_params) { { :user_id => user.id , :id => address.id, :address => {:address1 => "13 mahoe st", :city => "Welly", :district => "prirua",
                              :suburb => "ascot park", :post_code => "11111"  } } }

    before(:each) do
      session[:user_id] = user.id
    end

    context "with valid attributes" do
      it "will flash successfull message" do
        expect(update_user_address.request.flash[:success]).to_not be_nil
      end

      it "will redirect to user's addresses show page" do
      expect(update_user_address).to redirect_to("/users/#{ assigns(:user).id }/addresses/#{ assigns(:address).id }")
      end
    end

    context "with invalid attributes" do
      let(:address_params) { { :user_id => user.id , :id => address.id, :address => {:address1 => "13 mahoe st", :city => "Welly", :district => "prirua",
                              :suburb => "", :post_code => "11111"  } } }

        it "will display error messages" do
          expect(update_user_address.request.flash[:danger]).to_not be_nil
        end

        it "will render the edit template" do
          expect(update_user_address).to render_template(:edit)
        end
    end
  end

end
