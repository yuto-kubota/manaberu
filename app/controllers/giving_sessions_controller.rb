class GivingSessionsController < ApplicationController
  def new
  end

  def create
    giving = Giving.find_by(email: params[:giving_session][:email])
    if giving && giving.authenticate(params[:giving_session][:password])
      giving_login giving
      redirect_to giving
    else
      render 'new'
    end
  end

  def destroy
    giving_logout
    redirect_to root_path
  end
end
