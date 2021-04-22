class MainController < ApplicationController
  def index
    flash[:notice] = 'Some notice message'
    flash[:alert] = 'Some Alert message'
  end
end