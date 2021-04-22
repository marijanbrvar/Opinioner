class SessionsController < ApplicationController
  layout 'auth'

  def new; end

  def create
    @user = User.find_by(username: params[:username])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash[:alert] =
        "User does not exists, create account #{view_context.link_to('Register', register_path)}.".html_safe
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You are logged out now.'
  end
end
