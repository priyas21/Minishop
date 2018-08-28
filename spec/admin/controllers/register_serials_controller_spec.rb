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

  context "when the register serials are existing" do
    let(:register_serial) { register_serials(:register_serial1) }
    let(:register_serial_params) { { :user_id => user.id, :address_id => address.id,
    :icp_id => icp.id, :id => register_serial.id } }

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
      let(:update_register_serial) { patch :update, :params => updated_params }

      context "with updated attributes" do
        let(:updated_params) { {
          :user_id => user.id,
          :address_id => address.id,
          :icp_id => icp.id,
          :id => register_serial.id,
          :register_serial => {
            :meter_number => "555",
            :register_number => "78",
            :register_decimals => "8"
          }
        } }

          it "will flash a successfull message" do
            expect(update_register_serial.request.flash[:success]).to_not be_nil
          end

          it "redirects to index page with updated record" do
            expect(update_register_serial).to redirect_to admin_user_address_icp_register_serials_path(user, address, address.icp)
          end
        end
  end

    describe "#show" do
      let(:show_register_serial) { get :show, :params => register_serial_params }

    it "will display the specified register serial" do
      expect(show_register_serial).to render_template(:show)
    end
  end

    describe "#destroy" do
      let(:delete_register_serial) { delete :destroy, :params => register_serial_params }

      it "will allow the admin to delete the register serial" do
      expect{delete_register_serial}.to change{RegisterSerial.count}.by(-1)
    end
  end
end
end
