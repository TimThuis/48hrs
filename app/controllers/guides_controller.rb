class GuidesController < ApplicationController
  before_action :find_guide, only: [:detail, :show]

  respond_to :js, only: [:detail]

  def index #view
    @guides = User.where(guide: true)
    @booking = Booking.find(params[:id])
    @tours = Tour.all
  end

  def show #view
    @tour = @guide.tours.first
  end

  def detail
    if params[:category_id]
      @main_tour = @guide.tours.where(category_id: params[:category_id]).first
    else
      @main_tour = @guide.tours.first
    end

    @extra_tours = @guide.tours
    @extra_tours = @extra_tours.where.not(id: @main_tour.id) if @main_tour
    @reviews = Review.select { |review| review.booking.tour.user.first_name == "Emma" }
  end

  private
  def find_guide
    @guide = User.where(guide: true).find(params[:id])
  end

end
in
