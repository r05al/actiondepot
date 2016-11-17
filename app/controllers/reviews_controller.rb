class ReviewsController < ApplicationController
	before_action :require_signin!
	before_action :set_product
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	def new
		@review = @product.reviews.build
	end

	def create
		@review = @product.reviews.build(review_params)
		@review.user = current_user
		if @review.save
			redirect_to [@product, @review], notice: "Review has been created."
		else
			flash[:alert] = "Review has not been created."
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to [@product, @review], notice: "Review has been updated."
		else
			flash[:alert] = "Review has not been updated."
			render :edit
		end
	end

	def destroy
		@review.destroy
		flash[:alert] = "Review has been deleted."
		redirect_to @product
	end

	private
		def set_product
			@product = Product.for(current_user).find(params[:product_id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The product you were looking for " +
											"could not be found."
			redirect_to root_path
		end

		def review_params
			params.require(:review).permit(:title, :experience)
		end

		def set_review
			@review = @product.reviews.find(params[:id])
		end
end
