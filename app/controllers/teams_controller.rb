class TeamsController < ApplicationController
  before_action :set_teams, only: %i[show update edit destroy]

  def new
    @team = Team.new
    authorize @team
  end

  def create
    # @team.user = current_user
    # @team.team_member = current_user
    # @team_member = TeamMember.new
    # @team_member.user = current_user
    # @team_member.admin = true
    # @team.team_member_id = @team_member
    @team = Team.new(team_params)

    authorize @team
    if @team.save
      redirect_to join_path(@team)
      # redirect_to team_path(@team), notice: "New team created!"
      raise
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @teams = policy_scope(Team)
    authorize @teams
  end

  def edit
    authorize @team
  end

  def update
    authorize @team
    @team.update(team_params)
    redirect_to team_path(@team), notice: "team was updated!"
  end

  def destroy
    authorize @team
    @team.destroy
    redirect_to team_path, status: :see_other
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  private

  def set_teams
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
