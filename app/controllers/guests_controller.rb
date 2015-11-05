class GuestsController < ApplicationController

  def new
    @trip = Trip.find params[:trip_id]
    @guest = Guest.new
  end

  def index
    if params[:trip_id]
      @trip = Trip.find params[:trip_id]
      @guests = @trip.guests
    else
      @guests = Guest.all
    end
  end


  def create
    puts params
    @trip = Trip.find params[:trip_id]
     @guest = trip.guests.build guest_params
    if @guest.save
      flash[:notice] = "You're On The Guest List!"
      redirect_to trips_path(:trip_id)
    else
      render :new
    end
  end


  def update
    @guest = Guest.find(params[:id])
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


private
    # Implement Strong Params
    def trip_params
      params.require(:trip).permit(:id, :location, :date, :mode, :departure_location, :departure_time, :return_location, :return_time)
    end
end
