module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  # parent-----------------------

  def current_user_parent
    if session[:user_id]
      @current_user_parent ||= Parent.find_by(id: session[:user_id])
    end
  end

  def parent_logged_in?
    !current_user_parent.nil?
  end

  def parent_logout
    session.delete(:user_id)
    @current_user_parent = nil
  end
end
