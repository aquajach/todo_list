class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_parameter)
    if @task.save
      redirect_to action: :index
    else

    end
  end

private

  def task_parameter
    params.require(:task).permit(:name,:due_date)
  end
end