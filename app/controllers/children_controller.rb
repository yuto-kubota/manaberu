class ChildrenController < ApplicationController
  before_action :forbid_login_user, only:[:new, :create]
  def index
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    parent = Parent.find_by(id: @child.parent_id)
    if parent == nil
      render 'new'
    else
    if @child.avatar.attach(params[:child][:avatar]) && @child.parent_id == parent.id && @child.save
         child_login @child
         flash[:notice] = "ユーザー登録完了"
         redirect_to child_path(@child)
    else
      render 'new'
    end
    end
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      flash[:notice] = "ユーザー編集完了"
      redirect_to child_path(@child)
    else
      render 'edit'
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    child_logout
    flash[:notice] = "ユーザー削除完了"
    redirect_to root_path
  end

  private
   def child_params
     params.require(:child).permit(:name, :password, :password_confirmation, :parent_id, :avatar, :age, :nickname)
   end
end
