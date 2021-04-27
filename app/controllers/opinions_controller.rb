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
    opinion.likes.create(user_id: Current.user.id)
    redirect_to main_index_path
  end

  def dislike
    likes = Current.user.likes.find_by(opinion_id: params[:id])
    likes.destroy
    redirect_to main_index_path
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text, :author_id)
  end
end
