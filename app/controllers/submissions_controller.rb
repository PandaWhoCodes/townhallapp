class SubmissionsController < ApplicationController

  before_filter :find_series

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = @series.submissions.new(params[:submission])
    @submission.user = current_user
    if @submission.save
      redirect_to series_submissions_url(@series), :notice => "Successfully created submission."
    else
      render :action => 'new'
    end
  end

  private

  def find_series
    @series = Series.find(params[:series_id])
  end

end
