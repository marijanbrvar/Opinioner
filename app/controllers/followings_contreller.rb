class FollowingsController < ApplicationController
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
