class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    review.user = current_user
    @listing = Listing.find(params[:listing_id])

    if review.save

      respond_to do |format|

        format.html { redirect_to root_path }
        format.js

      end

    else

      flash[:danger] = "Unable to create review, try again!"

    end

  end

  def destroy

  end

  private

  def review_params

    params.permit(:review, :listing_id)

  end

end
