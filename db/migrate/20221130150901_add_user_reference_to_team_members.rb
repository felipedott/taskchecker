class AddUserReferenceToTeamMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :team_members, :user, null: false, foreign_key: true
  end
end
