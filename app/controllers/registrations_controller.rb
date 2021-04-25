class RegistrationsController < ApplicationController
  layout 'auth'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to main_index_path, notice: 'Successfully created account!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name)
  end
end
