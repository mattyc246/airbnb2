class ReservationsController < ApplicationController

  def index

    @reservations = Reservation.find_by(user_id: current_user.id)
    
  end

  def create

    reservation = Reservation.new(reservation_params)

    reservation.user = current_user
    reservation.listing = Listing.find(params[:listing_id])
    
    if reservation.save

      flash[:success] = "You have successfully made a booking!"
      redirect_to listings_path

    else

      flash[:alert] = "You were unable to book! Reason: #{reservation.errors.message}"
      redirect_to listing_path(params[:listing_id])

    end

  end

  private

  def reservation_params

    params.require(:reservation).permit(:check_in, :check_out, :guests, :listing_id)

  end
  
end
