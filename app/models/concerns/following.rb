module Following
  extend ActiveSupport::Concern

  included do
    has_many :followed_user_relationships, foreign_key: :follower_id, class_name: 'FollowingRelationship'
    has_many :followed_users, through: :followed_user_relationships

    has_many :follower_relationships, foreign_key: :followed_user_id, class_name: 'FollowingRelationship'
    has_many :followers, through: :follower_relationships
  end

  def following_user?(user)
    followed_user_ids.include?(user.id)
  end

  def follow(user)
    if self.id != user.id
      followed_users << user
    end
  end

  def unfollow(user)
    if self.id != user.id
      followed_users.delete(user)
    end
  end

  def can_follow?(user)
    self.id != user.id
  end
end