class BuddyCircleMembership < ActiveRecord::Base

  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  belongs_to(
    :buddy_circle,
    :class_name => "BuddyCircle",
    :foreign_key => :buddy_circle_id,
    :primary_key => :id
  )


end
