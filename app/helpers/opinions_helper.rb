module OpinionsHelper
  def following_opinions
    @opinions = Opinion.following_opinions(Current.user)
  end

  def already_liked?(opinion_id)
    Like.where(user_id: Current.user.id, opinion_id: opinion_id).exists?
  end

  def like_link(opinion_id)
    if already_liked?(opinion_id)
      link_to(raw('<i class="bi bi-hand-thumbs-up-fill"></i>'), dislike_path(opinion_id), method: :delete)
    else
      link_to(raw('<i class="bi bi-hand-thumbs-up"></i>'), like_path(opinion_id))
    end
  end
end
