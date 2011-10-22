class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :starts_at
      t.integer :min_attendance
      t.integer :max_attendance
      t.integer :user_id

      t.timestamps
    end
    add_index :events, :user_id
  end
end
