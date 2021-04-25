class MainController < ApplicationController
  include OpinionsHelper
  def index
    @opinion = Opinion.new
    @opinions = Current.user.opinions
  end

  def follow
    following = Current.user.followings.new(followed_id: params[:id])
    flash[:alert] = 'Failed!' unless following.save
    redirect_to request.referrer
  end

  def discover
    @not_followed = User.not_following_opinions(Current.user)
  end

  def profile
    @user = User.find(params[:id])
    @selected_opinions = @user.opinions.all.order(created_at: :desc)
  end

  def destroy
    following = Following.find_by(followed_id: params[:id], follower_id: Current.user.id)
    if following.follower == Current.user
      following.destroy
    else
      flash[:alert] = 'Fail'
    end
    redirect_to request.referrer
  end
end
