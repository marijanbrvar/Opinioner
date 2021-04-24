class MainController < ApplicationController
  def index
    @opinion = Opinion.new
    @users = User.all
    @opinions = Current.user.opinions
  end
end
