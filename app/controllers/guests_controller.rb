class GuestsController < ApplicationController

  def new
    @guest = Guest.new
  end

  def create
     @guest = Trip.new(guest_params)
    if @guest.save
      flash[:notice] = "You're On The Guest List!"
      redirect_to trips_path
    else
      render 'new'
    end
  end


  def update
    @guest = guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      flash[:success] = "Your Information Has Been Updated!"
      redirect_to trips_path
    else
      render 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id]).destroy
    flash[:success] = "You are out of the trip!"
    redirect_to trips_path
  end



  private
 def guest_params
      params.require(:guest).permit(:name, :email, :phone, :balance)
    end



end
