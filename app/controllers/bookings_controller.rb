class BookingsController < ApplicationController


  def new
    @colony = Colony.find(params[:colony_id])
    @booking = Booking.new
  end

  def create
    @colony = Colony.find(params[:colony_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.colony = @colony
    # raise
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def show_my_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end

end
