class Product < ApplicationRecord
	has_many :reviews, dependent: :destroy
	has_many :permissions, as: :thing

	scope :viewable_by, ->(user) do
		joins(:permissions).where(permissions: { action: "view", 
																						 user_id: user.id })
	end

	scope :for, ->(user) do
		user.admin?  ? Product.all : Product.viewable_by(user)
	end

	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
end
