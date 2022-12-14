class TeamsController < ApplicationController
  before_action :set_teams, only: %i[show update edit destroy]

  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)

    authorize @team
    if @team.save
      @team_member = TeamMember.new(user: current_user, team: @team)
      @team_member.admin = true
      @team_member.save
      redirect_to team_path(@team), notice: "New team created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @user = current_user
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
    redirect_to teams_path, status: :see_other
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
