class FinsController < ApplicationController

  def create
    fin = current_user_child.fins.build(post_id: params[:post_id])
    fin.save
    redirect_to post_path(id: params[:post_id])
  end

  def destroy
    fin = Fin.find_by(post_id: params[:post_id], child_id: current_user_child.id)
    fin.destroy
    redirect_to post_path(id: params[:post_id])
  end
end
