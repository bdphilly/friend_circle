class CreateBuddyCircles < ActiveRecord::Migration
  def change
    create_table :buddy_circles do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false
      t.timestamps
    end
  end
end
