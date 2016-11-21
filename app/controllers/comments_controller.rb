class CommentsController < ApplicationController
	# before_action :authorize_create!, only: :create
	before_filter :find_review

	def create
		@comment = @review.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to [@review.product, @review], notice: "Comment has been created."
		else
			flash[:alert] = "Comment has not been created."
			render :template => "reviews/show"
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:text)
		end

		def find_review
			@review = Review.find(params[:review_id])
		end

		# def authorize_create!
		# 	if !current_user.admin? && cannot?("create comments".to_sym, @product)
		# 		flash[:alert] = "You cannot create reviews on this product."
		# 		redirect_to @product
		# 	end
		# end
end
