class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.references :manager, foreign_key: { to_table: :team_members }
      t.references :member, foreign_key: { to_table: :team_members }
      t.timestamps
    end
  end
end
