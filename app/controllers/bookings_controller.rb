class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_tour, only: [:new, :create]

  def new # view
    @booking = Booking.new
    session[:user_return_to] = request.original_url
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.day == "today"
      @booking.date = Date.today
    else
      @booking.date = Date.tomorrow
    end

    @booking.guide = @tour.user
    @booking.tour = @tour
    @booking.visitor = current_user
    @booking.hour_rate = @tour.user.hour_rate
    @booking.total_price = @booking.hours * @booking.hour_rate
    @booking.status = :pending

    if @booking.save!
      redirect_to visitor_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:day, :check_in, :check_out)
  end

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end
end
