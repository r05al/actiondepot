class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :assets
  accepts_nested_attributes_for :assets

  validates :title, presence: true
  validates :experience, presence: true, length: { minimum: 10 }

end
