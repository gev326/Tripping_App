class TripController < ApplicationController
before_action :authorize, except: [:index, :show] #restrics access to adding houses if youre not logged in
before_action :set_trip, only: [:show, :edit, :update, :destroy]

def index
  @trips = Trip.all
end

def show
end

end
