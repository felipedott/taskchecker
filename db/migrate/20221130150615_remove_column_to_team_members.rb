class RemoveColumnToTeamMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :team_members, :user_id
  end
end
