class ActivitiesController < ApplicationController

def index
@activity = Activity.all
end

end
