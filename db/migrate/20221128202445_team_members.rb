class TeamMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :team_members do |t|
      t.integer :user_id
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
