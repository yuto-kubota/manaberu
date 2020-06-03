class ChildSessionsController < ApplicationController
  def new
  end

  def create
    child = Child.find_by(name: params[:child_session][:name])
    if child && child.authenticate(params[:child_session][:password])
      child_login child
      redirect_to child
    else
      render 'new'
    end
  end

  def destroy
    child_logout
    redirect_to root_path
  end
end
