require 'rails_helper'

feature 'Deleting reviews' do
	let!(:product) { FactoryGirl.create(:product) }
	let!(:user) { FactoryGirl.create(:user) }
	let!(:review) { FactoryGirl.create(:review, product: product, user: user) }

	before do
		sign_in_as!(user)
		
		visit '/'
		click_link product.title
		click_link review.title
	end

	scenario 'Deleting a review' do
		click_link 'Delete Review'

		expect(page).to have_content("Review has been deleted.")
		expect(page.current_url).to eq(product_url(product))
	end
end