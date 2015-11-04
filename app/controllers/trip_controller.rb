class TripController < ApplicationController
# before_action :authorize, except: [:index, :show] #restrics access to adding houses if youre not logged in
# before_action :set_trip, only: [:show, :edit, :update, :destroy]

def index
  @trips = Trip.all
end

  def show
        @trip = Trip.find(params[:id])

  end

 def new
    @trip = Trip.new
  end


  def edit
    @user = Trip.find(params[:id])

  end

  def create
    @trip = Trip.new(user_params)
    if @trip.save
      flash[:notice] = "You have created your trip! Lets get Started!"
      redirect_to trip_index_path
    else
      render 'new'
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:success] = "Your Trip Has Been Updated!"
      redirect_to trip_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id]).destroy
    flash[:success] = "You have cancelled the trip!"
    redirect_to trip_index_path
  end


  private
    # Implement Strong Params
    def trip_params
      params.require(:trip).permit(:location, :date, :transportation, :departure_location, :departure_time, :return_location, :return_time)
    end

end



