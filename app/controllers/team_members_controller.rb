class TeamMembersController < ApplicationController

  def join
    @user = User.find(params[:id])
    @team = Team.find(params[:id])

    @team_member = TeamMember.new(user: @user, team: @team)
    @team_member.save

  end
end


# TIME - > USUARIO
##
