class ActivityInstancesController < ApplicationController
  def show
    @activity_instance = ActivityInstance.find(params[:id])
  end


  def clue
    @activity_instance = ActivityInstance.find(params[:id])
  end

end
