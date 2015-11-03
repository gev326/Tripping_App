class TripController < ApplicationController

def index
  @trips = Trip.all
end

def show
end

end
