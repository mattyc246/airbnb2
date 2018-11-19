class Tag < ApplicationRecord
  validates :name, presence: true, on: [:create]
end
