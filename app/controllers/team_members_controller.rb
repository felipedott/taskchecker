class TeamMembersController < ApplicationController

  def join
    @user = User.find(params[:id])
    @team = Team.find(params[:id])

    @team_member = TeamMember.new(user: @user, team: @team)
    @team_member.save
    # if @team_member.save
    #   redirect_to team_path(team), notice: "New team created!"
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end
end
