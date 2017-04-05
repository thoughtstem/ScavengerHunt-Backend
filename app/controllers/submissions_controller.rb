class SubmissionsController < ApplicationController
  def new
    @activity_instance = ActivityInstance.find(params[:activity_instance_id])

    if @activity_instance.last_submission_for(current_team)
      redirect_to [@activity_instance, @activity_instance.last_submission_for(current_team)]
      return
    end

    @submission = Submission.new
  end

  def show
    @submission = Submission.find(params[:id])
    @activity_instance = ActivityInstance.find(params[:activity_instance_id])
  end

  def destroy
    @submission = Submission.find(params[:id])
    @activity_instance = ActivityInstance.find(params[:activity_instance_id])

    @submission.destroy

    redirect_to new_activity_instance_submission_path
  end

  def create
    @activity_instance = ActivityInstance.find(params[:activity_instance_id])

    @submission = Submission.new(submission_params)
    @submission.activity_instance = @activity_instance
    @submission.team = current_team

    if @submission.save
      flash[:success] = "The submission was added!"
      redirect_to [@activity_instance, @submission]
    else
      render 'new'
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:image, :title, :activity_instance_id)
  end
end
