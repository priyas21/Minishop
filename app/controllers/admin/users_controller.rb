class Admin::UsersController < ApplicationController
  before_action :require_admin, only: [ :index ]
 def index
    @users = User.where(admin: false)
  end
end
