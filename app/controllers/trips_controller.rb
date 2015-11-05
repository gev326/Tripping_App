class TripsController < ApplicationController
before_action :authorize, except: [:index, :show, :new, :create] #restrics access to adding/editing trips if youre not logged in
#before_action :set_trip, only: [:show, :new, :edit, :update, :destroy]

def index
  @trip = Trip.find_each(trip_id: current_user.id)
  @activity = Activity.all

end

  def show
   @trip = Trip.find(params[:location])

  end

 def new
    @trip = Trip.new

  end


  def edit
    @trip = Trip.find(params[:id])

  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "You have created your trip! Lets get Started!"
      redirect_to trips_path
    else
      render 'new'
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:success] = "Your Trip Has Been Updated!"
      redirect_to trips_path
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id]).destroy
    flash[:success] = "You have cancelled the trip!"
    redirect_to trips_path
  end


  private
    # Implement Strong Params
    def trip_params
      params.require(:trip).permit(:location, :date, :mode, :departure_location, :departure_time, :return_location, :return_time)
    end

end



