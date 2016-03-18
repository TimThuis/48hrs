class Visitor::BookingsController < ApplicationController
  before_action :find_booking, except: [:index]

  def index #view
    @bookings = Booking.all
  end

  def show #view
  end

  def cancel
    @booking.update("Booking Cancel")
    redirect_to visitor_bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
