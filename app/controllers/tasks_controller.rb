class TasksController < ApplicationController

  def index
    @tasks = policy_scope(Task)
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    # @task.user = current_user
    @task.manager_id = current_user
    authorize @task
    raise
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end
end
