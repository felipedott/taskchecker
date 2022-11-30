class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :manager, :boolean, default: false
    add_column :users, :member, :boolean, default: true
  end
end
