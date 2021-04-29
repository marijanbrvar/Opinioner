class ApplicationController < ActionController::Base
  before_action :set_current_user

  include FollowingsHelper

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in
    redirect_to login_path, alert: 'You must be signed in order to do that!' if Current.user.nil?
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
