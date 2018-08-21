class Admin::UsersController < AdminController

 def index
    @users = User.where(admin: false)
  end
end
