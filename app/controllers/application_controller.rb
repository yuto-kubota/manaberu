class ApplicationController < ActionController::Base
  include SessionsHelper

  def forbid_login_user
    if current_user_parent
      redirect_to parent_path(current_user_parent)
    elsif current_user_child
      redirect_to child_path(current_user_child)
    elsif current_user_giving
      redirect_to giving_path(current_user_giving)
    end
  end

  def ensure_correct_user_parent
    if current_user_parent.id != params[:id].to_i
      redirect_to parent_path(current_user_parent)
    end
  end

  def ensure_correct_user_child
    if current_user_child.id != params[:id].to_i
      redirect_to child_path(current_user_child)
    end
  end

  def ensure_correct_user_giving
    if current_user_giving.id != params[:id].to_i
      redirect_to giving_path(current_user_giving)
    end
  end

end
