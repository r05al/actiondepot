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
end
