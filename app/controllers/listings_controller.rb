class ListingsController < ApplicationController

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

    if params[:tags]
      listing.assign_tags
    end

    if listing.save

      flash[:success] = "You have successfully created the listing #{listing.title}!"
      redirect_to listing_path(listing.id)

    else

      flash[:danger] = "Unable to create the listing! Check all fields have been correctly filled out!"
      redirect_to new_listing_path

    end

  end

  def edit

    @listing = Listing.find(params[:id])

  end

  def update

    listing = Listing.find(params[:id])

    if listing.update(listing_params)
      
      flash[:success] = "You have successfully updated the listing details"
      redirect_to listing_path(listing.id)

    else

      flash[:danger] = "Unable to make the changes to this listing, please check your privileges"
      redirect_to listing_path(listing.id)

    end

  end

  def destroy

    listing = Listing.find(params[:id])

    if listing.destroy

      flash[:success] = "You have successfully removed this listing!"
      redirect_to root_path

    else

      flash[:danger] = "Unable to remove this listing, please make sure you have the correct permissions!"
      redirect_to listing_path(listing.id)

    end

  end

  def verify

    listing = Listing.find(params[:id])

    listing.verified = true

    if listing.save
      render :json => listing
    end

  end

  private

    def listing_params

      params.require(:listing).permit(:title, :property_type, :guests, :bedrooms, :bathrooms, :price_per_night, :address_line1, :city, :state, :country, :postcode,)

    end


end
