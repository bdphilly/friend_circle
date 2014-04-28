class Post < ActiveRecord::Base

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :links,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :shares,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :circles,
    through: :shares,
    source: :buddy_circle
  )


end
