class AddTeamIdToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :team, index: true
    add_foreign_key :tasks, :teams
  end
end
