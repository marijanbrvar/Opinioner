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
    content_tag(:small, link_to('Follow', follow_path(user), class: 'link-primary text-decoration-none'))
  end
end
