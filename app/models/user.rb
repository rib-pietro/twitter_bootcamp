class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  has_many :tweets

  def following?(other_user)
  	following.include? other_user
  end

  def follow!(other_user)
  	# active_relationships.create(followed: other_user)
  	following << other_user
  end

  def unfollow!(other_user)
  	following.destroy(other_user)
  end

  def feed
  	users_ids = following.pluck(:id)
  	users_ids << self.id
  	Tweet.where(user_id: users_ids).order(created_at: :desc)
  end

end
