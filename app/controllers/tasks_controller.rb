class TasksController < ApplicationController


  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.create(task_params)
    redirect_to action: :index
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date)
  end
end