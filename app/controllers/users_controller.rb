class UsersController < ApplicationController
  def index
    @stamps = Stamp.all
  end

  def new
    @page_title = 'Add New Stamp'
    @stamp = Stamp.new
  end

  def create
    @stamp = Stamp.new(stamp_params)
    @stamp.user_id = params[:id]
    if @stamp.save
      flash[:notice] = "Stamp created!"
      redirect_to stamp_path(@stamp.id)
    else
      render 'new'
    end
  end

  def update
    @stamp = Stamp.find(params[:id])
    @stamp.update(Stamp_params)
    flash[:notice] = 'Stamp Updated'
    redirect_to stamps_path
  end

  def edit
    @stamp = Stamp.find(params[:id])
  end

  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy
    flash[:notice] = 'Stamp Removed'
    redirect_to stamps_path
  end

  def show
    @stamps = Stamp.where(user_id: current_user.id)
  end

  private
  def stamp_params
    params.require(:stamp).permit(:subject, :title, :subtitle, :image, :year, :country_id, :currency_id, :condition_id, :face_value, :user_id)
  end
end
