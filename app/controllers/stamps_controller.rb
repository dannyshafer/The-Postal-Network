class StampsController < ApplicationController
  def index
    @stamps = Stamp.all
  end

  def new
    @page_title = 'Add New Stamp'
    @stamp = Stamp.new
  end

  def create
    @stamp = Stamp.new(stamp_params)
    @stamp.user_id = current_user.id
    if @stamp.save
      flash[:notice] = "Stamp created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def update
    @stamp = Stamp.find(params[:id])
    @stamp.update(stamp_params)
    flash[:notice] = 'Stamp Updated'
    redirect_to current_user
  end

  def edit
    @stamp = Stamp.find(params[:id])
  end

  def destroy
    @stamp = Stamp.find(params[:id])
    @stamp.destroy
    flash[:notice] = 'Stamp Removed'
    redirect_to current_user
  end

  def show
    @stamp = Stamp.find_by_id(params[:id])
    @comment = Comment.new
  end

  private
  def stamp_params
    params.require(:stamp).permit(:subject, :title, :subtitle, :image, :year, :country_id, :currency_id, :condition_id, :face_value, :user_id)
  end
end
