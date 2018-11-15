class ReservationsController < ApplicationController

  def create

  end

  private

  def reservation_params

    params.require(:reservation).permit(:check_in, :check_out)

  end
end
