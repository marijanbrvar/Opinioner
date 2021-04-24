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
end
