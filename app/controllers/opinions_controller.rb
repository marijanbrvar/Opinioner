class OpinionsController < ApplicationController
  before_action :require_user_logged_in

  include OpinionsHelper

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

  def like
    opinion = Opinion.find_by_id(params[:id])
    if already_liked?(opinion.id)
      flash[:notice] = "You can't like more than once"
    else
      opinion.likes.create(user_id: Current.user.id)
    end
    redirect_to main_index_path
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text, :author_id)
  end
end
