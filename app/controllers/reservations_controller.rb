class ReservationsController < ApplicationController

  def index

    @reservations = Reservation.where(user_id: current_user.id)
    
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

  def destroy

    reservation = Reservation.find(params[:reservation_id])

    if reservation.destroy

      flash[:success] = "You have successfully cancelled your reservation"
      redirect_to reservations_path

    else

      flash[:danger] = "Unable to cancel listing! Grace period expired!"
      redirect_to reservations_path

    end

  end

  private

  def reservation_params

    params.require(:reservation).permit(:check_in, :check_out, :guests, :listing_id)

  end
  
end
