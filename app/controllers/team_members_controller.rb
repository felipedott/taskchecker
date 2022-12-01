class TeamMembersController < ApplicationController
  before_action :set_team, only: [:new, :create]

  # def join
  #   @user = User.find(params[:id])
  #   @team = Team.find(params[:id])

  #   @team_member = TeamMember.new(user: @user, team: @team)
  #   @team_member.save

  # end

  def new
    @team_member = TeamMember.new
    authorize @team_member
  end

  def create
    @team_member = TeamMember.new(member_params)
    @team_member.team_id = @team.id
    authorize @team_member

    if @team_member.save
      redirect_to team_path(@team)
    else
      render 'team_members/new', status: :unprocessable_entity
    end
  end

  private

  def member_params
    params.require(:team_member).permit(:user_id, :team_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end


# TIME - > USUARIO
##
