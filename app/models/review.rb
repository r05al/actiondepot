class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :title, presence: true
  validates :experience, presence: true, length: { minimum: 10 }
end
