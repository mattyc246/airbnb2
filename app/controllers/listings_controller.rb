lass ListingsController < ApplicationController

  def index

    @listings = Listing.all

  end

  def show

    @listing = Listing.find(params[:id])

  end

  def new

  end

  def create

    listing = Listing.new(listing_params)
    listing.user = current_user

    if listing.save

      flash[:success] = "You have successfully created the listing #{listing.title}!"
      redirect_to listing_path(listing.id)

    else

      flash[:danger] = "Unable to create the listing! Check all fields have been correctly filled out!"
      redirect_to new_listing_path

    end

  end

  def update

  end

  def destroy

  end

  private

    def listing_params

      params.require(:listing).permit(:title, :property_type, :guests, :bedrooms, :bathrooms, :price_per_night, :address_line1, :city, :state, :country, :postcode,)

    end


end
