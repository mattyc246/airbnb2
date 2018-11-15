class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :tags

  def self.property_type

    ["House", "Shared Accomodation", "Hostel", "Hotel"]

  end

end
