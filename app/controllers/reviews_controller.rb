class ReviewsController < ApplicationController
	before_action :set_product
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	def new
		@review = @product.reviews.build
	end

	def create
		@review = @product.reviews.build(review_params)
		if @review.save
			redirect_to [@product, @review], notice: "Review has been created."
		else
			flash[:alert] = "Review has not been created."
			render :new
		end
	end

	def show
	end

	private
		def set_product
			@product = Product.find(params[:product_id])
		end

		def review_params
			params.require(:review).permit(:title, :experience)
		end

		def set_review
			@review = @product.reviews.find(params[:id])
		end
end
