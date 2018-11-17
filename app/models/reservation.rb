class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :check_in, presence: true, on: [:create]
  validates :check_out, presence: true, on: [:create]
  validates :guests, presence: true, on: [:create]
  validate :no_overlapping_dates, on: [:create]

  def no_overlapping_dates

    listing = Listing.find(self.listing_id)

    listing.reservations.each do |res|

      if (self.check_in..self.check_out).overlaps?(res.check_in..res.check_out) && res != self

        return true

      else

        return false

      end

    end

  end

end
