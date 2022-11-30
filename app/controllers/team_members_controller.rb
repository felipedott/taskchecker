class TeamMembersController < ApplicationController

  def join(team)
    @user = current_user

    @team_member = TeamMember.new(user: @user, team: team)
    @team_member.save

  end
end


# TIME - > USUARIO
##
