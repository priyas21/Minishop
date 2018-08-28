require 'rails_helper'

RSpec.describe Admin::RegisterSerialsController, type: :controller do
  fixtures :all
  let(:user) { users(:lilly) }
  let(:admin) { users(:sam)}
  let(:address) { addresses(:first_property) }
  let(:icp) { icps(:icp1) }
  let(:register_serial) { register_serials(:register_serial1) }
  before(:each) do
    session[:user_id] = admin.id
  end

  describe "#new" do
  end

  describe "#create" do
  end

  describe "#index" do
    let(:show_all_register_serials) { get :index, :params => register_serial_params }
    let(:register_serial_params) { { :user_id => user.id, :address_id => address.id,
    :icp_id => icp.id } }

    describe "#index" do
      let(:show_all_register_serials) { get :index, :params => { :user_id => user.id,
      :address_id => address.id,
      :icp_id => icp.id  } }
    it "will display all the register serials of the user's property" do
      expect(show_all_register_serials).to render_template(:index)
    end
  end

  describe "#edit" do
      let(:edit_register_serial) { get :edit, :params => register_serial_params }

      it "will allow the admin to edit register serial" do
        expect(edit_register_serial).to render_template(:edit)
  end
    end

  describe "#update" do
  end

  describe "#show" do
    let(:show_register_serial) { get :show, :params => register_serial_params }
    let(:register_serial_params) { { :user_id => user.id, :address_id => address.id,
    :icp_id => icp.id, :id => register_serial.id } }

    it "will display the specified register serial" do
      expect(show_register_serial).to render_template(:show)
    end
  end

  describe "#destroy" do
    let(:delete_register_serial) { delete :destroy, :params => register_serial_params }
    let(:register_serial_params) { { :user_id => user.id, :address_id => address.id,
    :icp_id => icp.id, :id => register_serial.id } }

    it "will delete the register serials linked to the property" do
      expect{delete_register_serial}.to change{RegisterSerial.count}.by(-1)
    end
  end
end
