class OpinionsController < ApplicationController
  before_action :require_user_logged_in
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Current.user.opinions.new(opinion_params)
    if @opinion.save
      redirect_to main_index_path, notice: 'Saved'
    else
      flash[:alert] = 'Not saved!'
      redirect_to request.referrer
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text, :author_id)
  end
end
