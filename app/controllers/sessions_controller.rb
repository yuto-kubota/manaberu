class SessionsController < ApplicationController
  before_action :forbid_login_user, except:[:destroy]
  def new
  end

  def create
   user = Parent.find_by(email: params[:session][:email])
   if user && user.authenticate(params[:session][:password])
     parent_login user
     redirect_to user
   else
     render 'new'
   end
  end

  def destroy
    parent_logout
    redirect_to root_path
  end
end
