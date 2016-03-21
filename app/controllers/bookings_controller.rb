class BookingsController < ApplicationController
  before_action :find_tour, only: [:new, :create]

  def new #view
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.visitor = current_user

    if @booking.save
      redirect_to visitor_bookings_path(@booking.tour_id, @booking.id)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end
end


