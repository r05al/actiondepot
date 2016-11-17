require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:product) { FactoryGirl.create(:product) }
	let(:review) { FactoryGirl.create(:review,
																		 product: product,
																		 user: user) }

	context "standard users" do
		it "cannot access a ticket for a product" do
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

		it "cannot begin to create a ticket" do
			get :new, product_id: product.id
			cannot_create_reviews!
		end

		it "cannot create a review without permission" do
			post :create, product_id: product.id
			cannot_create_reviews!	
		end
	end
end
