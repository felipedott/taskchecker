class RemoveReferenceTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :team_member_id
  end
end
