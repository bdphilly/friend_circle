class PostShare < ActiveRecord::Base

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  belongs_to(
    :buddy_circle,
    class_name: "BuddyCircle",
    foreign_key: :buddy_circle_id,
    primary_key: :id
  )
# It should display the items shared with the current user (posts with bodies and associated links, along with the author of that post)

  def is_shared_post?(user)
    buddy_circle.members.include?(user.id)
  end



end

# Post
# PostShare
# Circles
# CircleMemberships
# filter out only circle memberships we're in.