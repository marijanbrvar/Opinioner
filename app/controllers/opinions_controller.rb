class OpinionsController < ApplicationController
  before_action :require_user_logged_in
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Current.user.opinions.new(opinion_params)

    # render plain: @opinion.inspect

    if @opinion.save
      redirect_to root_path, notice: 'Saved'
    else
      render :new
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text, :author_id)
  end
end