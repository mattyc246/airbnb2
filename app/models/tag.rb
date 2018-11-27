class Tag < ApplicationRecord
  validates :name, presence: true, on: [:create]
  has_and_belongs_to_many :listings
end
