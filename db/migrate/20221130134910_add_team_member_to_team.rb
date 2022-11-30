class AddTeamMemberToTeam < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :team_member, index: true
    add_foreign_key :teams, :team_members
  end
end
