class SubtasksController < ApplicationController
  before_action :set_task, only: [:new, :create]
  before_action :set_subtask, only: [:show, :edit, :update]

  def index
    @subtasks = policy_scope(Subtask)
    authorize @subtasks
  end

  def new
    @subtask = Subtask.new
    authorize @subtask
  end

  def create
    @subtask = Subtask.new(subtask_params)
    @subtask.task_id = @task.id

    authorize @subtask
    if @subtask.save
      redirect_to task_path(@task)
    else
      render 'subtasks/new', status: :unprocessable_entity
    end
  end

  def show
    authorize @subtask
  end

  def edit
    authorize @subtask
  end

  def update
    authorize @subtask
    @subtask.update(subtask_params)
    redirect_to task_subtask_path(@subtask), notice: "Task was updated!"
  end

  private

  def subtask_params
    params.require(:subtask).permit(:name, :description, :deadline, :task_id)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_subtask
    @subtask = Subtask.find(params[:id])
  end
end
