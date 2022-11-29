class TasksController < ApplicationController

  def index
    @tasks = policy_score(Task)
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    # @task.user = current_user
    authorize @task
    if @task.save
      # redirect_to my_tasks_tasks_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @task
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end
end
