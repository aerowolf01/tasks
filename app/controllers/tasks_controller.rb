class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    params.permit!
    Task.create params[:task]
    redirect_to :back
  end
end
