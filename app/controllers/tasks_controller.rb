class TasksController < ApplicationController
  before_action :set_team, only: [:new, :create]

  def index
    # RESOLVER ESTA MERDA EM ALGUM MOMENTO

    # IF USER = MANAGER
    # @user = current_user
    # @team = Team.find(@user)
    # @team_member = TeamMember.where(team_id: @team, user_id: @user)

    @tasks = policy_scope(Task)
    authorize @tasks
    # ELSE
    # @tasks = policy_scope(Task).where(user: current_user)
    # binding.pry
  end

  def new
    @task = Task.new
    @team_members = TeamMember.where(team_id: @team.id, admin: false)
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.manager = current_user
    @task.team_id = @team.id
    authorize @task
    if @task.save
      redirect_to task_path(@task)
    else
      render 'tasks/new', status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :member_id, :team_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

end
