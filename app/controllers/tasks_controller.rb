class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    params.permit!
    Task.create params[:task]
    redirect_to :back
  end

  def edit
    params.permit!
    @task = Task.find params[:id]
  end

  def update
    params.permit!
    task = Task.find params[:id]
    if task.update_attributes params[:task]
      redirect_to tasks_path, :notice => 'Your task has been updated!'
    else
      redirect_to :back, :notice => "There was an error updating your content."
    end
  end
end
