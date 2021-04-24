module OpinionsHelper
  def following_opinions
    @opinions = Opinion.following_opinions(Current.user)
  end
end
