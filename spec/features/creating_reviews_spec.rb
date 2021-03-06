require 'rails_helper'

feature "Creating Reviews" do
	before do
		product = FactoryGirl.create(:product)
		user = FactoryGirl.create(:user)
		define_permission!(user, "view", product)
		define_permission!(user, "create reviews", product)
		@email = user.email
		sign_in_as!(user)

		visit '/'
		click_link product.title
		click_link "Review Product"
	end

	scenario "Creating a review" do
		fill_in "Title", with: "Fastest in the league"
		fill_in "Experience", with: "Unbelievable!"
		click_button "Create Review"

		expect(page).to have_content("Review has been created.")
		within "#review #author" do
			expect(page).to have_content("Written by #{@email}")
		end
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

	scenario "Creating a review with an attachment", js: true do
		fill_in "Title", with: "Add documentation for faa regulation"
		fill_in "Experience", with: "New regulation suggestions"

		attach_file "File 1", Rails.root.join("spec/fixtures/update.txt")

		click_link "Add another file"
		attach_file "File 2", Rails.root.join("spec/fixtures/update2.txt")

		click_button "Create Review"

		expect(page).to have_content("Review has been created.")

		within("#review .assets") do
			expect(page).to have_content("update.txt")
			expect(page).to have_content("update2.txt")
		end
	end
end