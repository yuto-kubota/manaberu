class SessionsController < ApplicationController
  def new
  end

  def create
   user = Parent.find_by(email: params[:session][:email])
   if user && user.authenticate(params[:session][:password])
     login user
     redirect_to user
   else
     render 'new'
   end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
