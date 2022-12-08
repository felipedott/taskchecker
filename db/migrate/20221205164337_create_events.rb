class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.string :venue
      t.text :description
      t.string :google_event_id
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :guest_list

      t.timestamps
    end
  end
end
