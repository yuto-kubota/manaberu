class ParentsController < ApplicationController
  def index
    @parents = Parent.all.order(created_at: :desc)
  end

  def show
    @parent = Parent.find(params[:id])
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      login @parent
      flash[:notice] = "ユーザー登録完了"
      redirect_to parent_path(@parent)
    else
      render 'new'
    end
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def update
    @parent = Parent.find(params[:id])
    @parent.update(parent_params)
    if @parent.save
      flash[:notice] = "ユーザー編集完了"
      redirect_to parent_path(@parent)
    else
      render 'edit'
    end
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    flash[:notice] = "ユーザー削除完了"
    redirect_to parents_path
  end

  private
   def parent_params
     params.require(:parent).permit(:name, :email, :password, :password_confirmation)
   end
end
