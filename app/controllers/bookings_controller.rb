class BookingsController < ApplicationController
  before_action :find_tour, only: [:new, :create]

  def new #view
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.guide = @tour.user
    @booking.tour = @tour
    @booking.visitor = current_user
    @booking.hour_rate = @tour.user.hour_rate
    @booking.total_price = @booking.hours * @booking.hour_rate
    @booking.status = :pending

    if @booking.save
      redirect_to visitor_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :check_in, :check_out)
  end

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end
end
