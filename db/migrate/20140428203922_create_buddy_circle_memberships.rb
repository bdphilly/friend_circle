class CreateBuddyCircleMemberships < ActiveRecord::Migration
  def change
    create_table :buddy_circle_memberships do |t|
      t.string :user_id, null: false
      t.string :buddy_circle_id, null: false

      t.timestamps
    end
    add_index :buddy_circle_memberships, :user_id, unique: true
    add_index :buddy_circle_memberships, :buddy_circle_id, unique: true
  end
end
