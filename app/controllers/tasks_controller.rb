class TasksController < ApplicationController


  def index
    # RESOLVER ESTA MERDA EM ALGUM MOMENTO

    # IF USER = MANAGER
    @tasks = policy_scope(Task)
    authorize @tasks
    # ELSE
    # @tasks = policy_scope(Task).where(user: current_user)
    # binding.pry
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    # @task.user = current_user
    @task.manager = current_user
    # binding.pry
    authorize @task

    if @task.save
      redirect_to task_path(@task)
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
    params.require(:task).permit(:name, :description, :deadline, :member_id)
  end
end
