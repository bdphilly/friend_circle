class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_session_token
  validates :email, :password_digest, :token, presence: true
  # validates :password, presence: true
  validates :email, uniqueness: true

  has_many(
    :memberships,
    :class_name => "BuddyCircleMembership",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  has_many(
    :posts,
    :class_name => "Post",
    :foreign_key => :author_id,
    :primary_key => :id
  )

  has_many(
    :buddy_circles,
    through: :memberships,
    source: :buddy_circle
  )


  def self.find_by_credentials(email, password)
      user = User.find_by_email(email)

      user.try(:is_password?, password) ? user : nil
  end

  def reset_session_token!
    self.token = SecureRandom.hex
    self.save!
    self.token
  end

  def password=(plain_text)
   if plain_text.present?
      @password = plain_text
      self.password_digest = BCrypt::Password.create(plain_text)
    end
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end

  private
  def ensure_session_token
    self.token ||= SecureRandom.hex
  end
end
