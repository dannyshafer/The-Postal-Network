class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @page_title = 'Add New User'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created!"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update
    flash[:notice] = 'User Updated'
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User Removed'
    redirect_to users_path
  end

  def show
    @user = User.find_by_id(params[:id])
    @stamps = Stamp.where(user_id: @user.id)
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
