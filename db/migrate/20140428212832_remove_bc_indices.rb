class RemoveBcIndices < ActiveRecord::Migration
  def change
    remove_index(:buddy_circle_memberships, :buddy_circle_id)
    remove_index(:buddy_circle_memberships, :user_id)
  end
end
