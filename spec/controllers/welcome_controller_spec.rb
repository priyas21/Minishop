require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "succeeds" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
