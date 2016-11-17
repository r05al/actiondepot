require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:product) { FactoryGirl.create(:product) }
	let(:review) { FactoryGirl.create(:review,
																		 product: product,
																		 user: user) }

	context "standard users" do
		it "cannot access a review for a product" do
			sign_in(user)
			get :show, :id => review.id, :product_id => product.id

			expect(response).to redirect_to(root_path)
			expect(flash[:alert]).to eql("The product you were looking " +
																	 "for could not be found.")
		end
	end

	context "with permission to view the product" do
		before do
			sign_in(user)
			define_permission!(user, "view", product)
		end

		def cannot_create_reviews!
			response.should redirect_to(product)
			message = "You cannot create reviews on this product."
			flash[:alert].should eql(message)
		end

		def cannot_update_reviews!
			expect(response).to redirect_to(product)
			expect(flash[:alert]).to eql("You cannot edit reviews " \
																	 "on this product.")
		end

		it "cannot begin to create a review" do
			get :new, product_id: product.id
			cannot_create_reviews!
		end

		it "cannot create a review without permission" do
			post :create, product_id: product.id
			cannot_create_reviews!	
		end

		it "cannot edit a review without permission" do
			get :edit, { product_id: product.id, id: review.id }
			cannot_update_reviews!
		end

		it "cannot update a review without permission" do
			put :update, { product_id: product.id,
										 id: review.id,
										 review: {}
										}
			cannot_update_reviews!
		end

		it "cannot delete a review without permission" do
			delete :destroy, { product_id: product.id, id: review.id }

			expect(response).to redirect_to(product)
			message = "You cannot delete reviews from this product."
			expect(flash[:alert]).to eql(message)
		end
	end
end
