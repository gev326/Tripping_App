class GuestsController < ApplicationController

  def index
    @guests = Trip.find(params[:trip_id]).guests
  end

  def new
    @guest = Guest.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @guest = @trip.guests.build guest_params

    if @guest.save
      flash[:notice] = "You're On The Guest List!"
      redirect_to trips_path
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @guest = @trip.guests.find(params[:id])
  end

  def update

    @guest = Guest.find(params[:id])
    if @trip.guests.update_attributes(guest_params)
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
