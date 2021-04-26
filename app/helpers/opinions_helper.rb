module OpinionsHelper
  def following_opinions
    @opinions = Opinion.following_opinions(Current.user)
  end

  def already_liked?(opinion_id)
    Like.where(user_id: Current.user.id, opinion_id: opinion_id).exists?
  end
end
