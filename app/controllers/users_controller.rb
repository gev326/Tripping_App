class UsersController < ApplicationController
# /before_action :authorize, except: [:index, :show] #restrics access to editing if youre not logged in
# /before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
        @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up for Trippin Out! Organize Your Trip Now!"
      redirect_to trip_index_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your Info Has Been Updated!"
      redirect_to trip_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "You have left the trip!"
    redirect_to root_path
  end


  private
    # Implement Strong Params
    def user_params
      params.require(:user).permit(:name, :phone, :balance, :email, :password, :password_confirmation)
    end

end
