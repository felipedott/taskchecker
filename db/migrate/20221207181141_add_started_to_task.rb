class AddStartedToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :started, :boolean, default: false
  end
end
