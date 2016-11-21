require 'rails_helper'

feature "Creating comments" do
	let!(:user) { FactoryGirl.create(:user) }
	let!(:product) { FactoryGirl.create(:product) }
	let!(:review) { FactoryGirl.create(:review, :product => product, :user => user) }

	before do
		define_permission!(user, "view", product)

		sign_in_as!(user)
		visit '/'
		click_link product.title
	end

	scenario "Creating a comment" do
		click_link review.title
		fill_in "Text", with: "Added notes for future."
		click_button "Create Comment"
		page.should have_content("Comment has been created.")
		within("#comments") do
			page.should have_content("Added notes for future.")
		end
	end

	scenario "Creating an invalid comment" do
		click_link review.title
		click_button "Create Comment"
		page.should have_content("Comment has not been created.")
		page.should have_content("Text can't be blank")
	end
end