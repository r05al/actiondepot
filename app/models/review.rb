class Review < ApplicationRecord
  belongs_to :product

  validates :title, presence: true
  validates :experience, presence: true, length: { minimum: 10 }
end
