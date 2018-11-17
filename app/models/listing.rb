class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :tags
  has_many :reviews

  validates :title, presence: true, on: [:create]
  validates :property_type, presence: true, on: [:create]
  validates :guests, presence: true, on: [:create]
  validates :bedrooms, presence: true, on: [:create]
  validates :bathrooms, presence: true, on: [:create]
  validates :price_per_night, presence: true, on: [:create]
  validates :address_line1, presence: true, on: [:create]
  validates :city, presence: true, on: [:create]
  validates :state, presence: true, on: [:create]
  validates :postcode, presence: true, on: [:create]
  validates :country, presence: true, on: [:create]

  def self.property_type

    ["House", "Shared Accomodation", "Hostel", "Hotel"]

  end

end
