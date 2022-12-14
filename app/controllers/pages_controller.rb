class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
  end

  def dashboard
    # DASHBOARD TEM ACESSO A TUDO (ainda que nao seja utilizado no momento)
    @user = current_user
    @tasks = policy_scope(Task)
    @team_members = policy_scope(TeamMember)
    @teams = policy_scope(Team)
    @events = policy_scope(Event)
  end
end
