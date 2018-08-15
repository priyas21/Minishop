class Admin::UsersController < ApplicationController
 def index
    @users = User.where(admin: false)
  end
end