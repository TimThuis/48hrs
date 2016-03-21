class Account::BookingsController < ApplicationController
before_action :find_booking, only: [:accept, :decline]

  def index #view
    if user_signed_in?
      @bookings = current_user.requests
      @guide = current_user
    else
      redirect_to root_path
    end
  end

  def accept
   @booking.update(status: "accepted" )
   redirect_to account_bookings_path
  end

  def decline
    @booking.update(status: "declined" )
    redirect_to account_bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
