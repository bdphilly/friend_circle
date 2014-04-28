class BuddyCircle < ActiveRecord::Base
  belongs_to :owner, :foreign_key => :user_id, :class_name => 'User'
  has_many(
    :memberships,
    class_name: "BuddyCircleMembership",
    foreign_key: :buddy_circle_id,
    primary_key: :id
  )

  has_many(
    :members,
    through: :memberships,
    source: :user)

  has_many(
    :shares,
    class_name: "PostShare",
    foreign_key: :buddy_circle_id,
    primary_key: :id)

  has_many(
    :posts,
    through: :shares,
    source: :post
  )

end
