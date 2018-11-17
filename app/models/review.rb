class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :review, presence: true, on: [:create]
  
end
