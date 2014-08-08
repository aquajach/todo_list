class TasksController < ApplicationController

  def index
    @task = Task.all
    @new_task = Task.new
  end

  def create

    @task = Task.create(task_params)

    @task.submit! if params[:commit] == 'Submit'

    redirect_to tasks_path(@task)

  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date)
  end
end