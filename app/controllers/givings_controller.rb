class GivingsController < ApplicationController
  before_action :forbid_login_user, only:[:new, :create]
  def new
    @giving = Giving.new
  end

  def create
    @giving = Giving.new(giving_params)
    if @giving.avatar.attach(params[:giving][:avatar]) && @giving.save
      giving_login @giving
      flash[:notice] = "ユーザー登録完了"
      redirect_to giving_path(@giving)
    else
      render 'new'
    end
  end

  def index
    @givings = Giving.all.order(created_at: :desc)
  end

  def show
    @giving = Giving.find(params[:id])
    @posts = @giving.posts
  end

  def edit
    @giving = Giving.find(params[:id])
  end

  def update
    @giving = Giving.find(params[:id])
    if @giving.update(giving_params)
      flash[:notice] = "ユーザー編集完了"
      redirect_to giving_path(@giving)
    else
      render 'edit'
    end
  end

  def destroy
    @giving = Giving.find(params[:id])
    giving_logout
    @giving.destroy
    flash[:notice] = "ユーザー削除完了"
    redirect_to root_path
  end

  private
   def giving_params
     params.require(:giving).permit(:name, :email, :password, :password_confirmation, :avatar)
   end
end
