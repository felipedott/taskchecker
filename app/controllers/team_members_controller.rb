class TeamMembersController < ApplicationController
  before_action :set_team, only: [:new, :create]

  def new
    @users = User.all
    @team_member = TeamMember.new
    authorize @team_member
  end

  def create
    @team_member = TeamMember.new(member_params)
    authorize @team_member
    if find_user
      @team_member.team_id = @team.id
      @team_member.user_id = @user.id
      if @team_member.save
        redirect_to team_path(@team)
      else
        render 'team_members/new', status: :unprocessable_entity
      end
    end
  end

  private

  def find_user
    @user = User.find_by_email(params[:team_member][:user_id])
  end

  def member_params
    params.require(:team_member).permit(:user_id, :team_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
