module UsersHelper
  def follow_button(user)
    if current_user.following_user? user
      button_to 'Unfollow', user_follow_path(user), method: :delete, disabled: !current_user.can_follow?(user)
    else
      button_to 'Follow', user_follow_path(user), disabled: !current_user.can_follow?(user)
    end
  end
end