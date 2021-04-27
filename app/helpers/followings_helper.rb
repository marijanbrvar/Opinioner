module FollowingsHelper
  def not_following_users
    @users = User.not_following_users(Current.user)
  end

  def following?(user)
    !Following.where(follower_id: Current.user.id, followed_id: user.id).empty?
  end

  def following(user)
    User.following(user)
  end

  def followed_by(user)
    User.followers(user)
  end

  def follow_link(user)
    if following?(user)
      content_tag(:small, link_to('Unfollow', follow_path(user.id), method: :delete, class: 'link-primary text-decoration-none'))
    else
      content_tag(:small, link_to('Follow', follow_path(user), class: 'link-primary text-decoration-none'))
    end
  end
end
