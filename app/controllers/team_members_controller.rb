class TeamMembersController < ApplicationController

  def join(team)
    @user = current_user

    @team_member = TeamMember.new(user: @user, team: team)
    if @team_member.save
      redirect_to team_path(team), notice: "New team created!"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
