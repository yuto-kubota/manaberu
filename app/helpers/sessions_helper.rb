module SessionsHelper
    # parent-----------------------
  def parent_login(parent)
    session[:parent] = parent.id
  end

  def current_user_parent
    if session[:parent]
      @current_user_parent ||= Parent.find_by(id: session[:parent])
    end
  end

  def parent_logged_in?
    !current_user_parent.nil?
  end

  def parent_logout
    session.delete(:parent)
    @current_user_parent = nil
  end

  # child------------------------
  def child_login(child)
    session[:child] = child.id
  end

  def current_user_child
    if session[:child]
      @current_user_child ||= Child.find_by(id: session[:child])
    end
  end

  def child_logged_in?
    !current_user_child.nil?
  end

  def child_logout
    session.delete(:child)
    @current_user_child = nil
  end
end
