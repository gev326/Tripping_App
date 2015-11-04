class ActivitiesController < ApplicationController
before_action :authorize, except: [:index, :show] #restrics access to adding/editing trips if youre not logged in

def index
@activity = Activity.all
end

  def show
        @activity = Activity.find(params[:id])

  end

 def new
    @activity = Activity.new
  end


  def edit
    @activity = Activity.find(params[:id])

  end

  def create
    @activity = Activity.new(activities_params)
    if @activity.save
      flash[:notice] = "You have created your trip! Lets get Started!"
      redirect_to activities_path
    else
      render 'new'
    end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activities_params)
      flash[:success] = "Your Activity Has Been Updated!"
      redirect_to trips_path
    else
      render 'edit'
    end
  end

  def destroy
    @Activity = Activity.find(params[:id]).destroy
    flash[:success] = "You have cancelled the trip!"
    redirect_to trips_path
  end


  private
    # Implement Strong Params
    def activities_params
      params.require(:activity).permit(:date, :event, :time, :location, :information)
    end

end


