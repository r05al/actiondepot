require 'rails_helper'

feature "Creating Reviews" do
	before do
		FactoryGirl.create(:product, title: "HawkFlight")

		visit '/'
		click_link "HawkFlight"
		click_link "Review Product"
	end

	scenario "Creating a review" do
		fill_in "Title", with: "Fastest in the league"
		fill_in "Experience", with: "Unbelievable!"
		click_button "Create Review"

		expect(page).to have_content("Review has been created.")
	end

	scenario "Creating a review without valid attributes fails" do
		click_button "Create Review"

		expect(page).to have_content("Review has not been created.")
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Experience can't be blank")
	end

	scenario "Experience must be longer than 10 characters" do
		fill_in "Title", with: "Short Battery Life"
		fill_in "Experience", with: "blows"
		click_button "Create Review"

		expect(page).to have_content("Review has not been created.")
		expect(page).to have_content("Experience is too short")
	end
end