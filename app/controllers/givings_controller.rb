class GivingsController < ApplicationController
  def new
    @giving = Giving.new
  end

  def create
    @giving = Giving.new(giving_params)
    if @giving.save
      giving_login @giving
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
      redirect_to giving_path(@giving)
    else
      render 'edit'
    end
  end

  def destroy
    @giving = Giving.find(params[:id])
    giving_logout
    @giving.destroy
    redirect_to root_path
  end

  private
   def giving_params
     params.require(:giving).permit(:name, :email, :password, :password_confirmation)
   end
end
