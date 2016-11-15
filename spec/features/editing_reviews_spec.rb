require 'rails_helper'

feature "Editing reviews" do
	let!(:product) { FactoryGirl.create(:product) }
	let!(:review) { FactoryGirl.create(:review, product: product) }

	before do
		visit '/'
		click_link product.title
		click_link review.title
		click_link "Edit Review"
	end

	scenario "Updating a review" do
		fill_in "Title", with: "Best gift ever"
		click_button "Update Review"

		expect(page).to have_content "Review has been updated."

		within("#review h2") do
			expect(page).to have_content("Best gift ever")
		end

		expect(page).to_not have_content review.title
	end

	scenario "Updating a reivew with invalid information" do
		fill_in "Title", with: ""
		click_button "Update Review"

		expect(page).to have_content("Review has not been updated.")
	end
end