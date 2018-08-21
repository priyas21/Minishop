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
   let(:show_addresses) { get :index, :params => address_params }
   let(:address_params) { { :user_id => user.id, :id => address.id } }

   before { session[:user_id] = user.id }

    it "will display all the addresses of the user" do
      expect(show_addresses).to render_template(:index)
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

end
