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


end
