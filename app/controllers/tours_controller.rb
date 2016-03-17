class ToursController < ApplicationController

  def index #view
    @tours = Tour.all
  end

  def show #view
    @tour = Tour.find(params[:id])
  end

end
