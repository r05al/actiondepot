require 'rails_helper'

feature 'Editing Products' do
	before do
		FactoryGirl.create(:product, title: "FlyZone 3000")
		sign_in_as!(FactoryGirl.create(:admin_user))

		visit '/'
		click_link "FlyZone 3000"
		click_link "Edit"
	end

	scenario 'Updating a product' do
		fill_in "Title", with: "FlyZone 3001"
		click_button "Update Product"

		expect(page).to have_content("Product was successfully updated.")
	end

	scenario 'Updating a product with invalid attributes' do
		fill_in "Title", with: ""
		click_button "Update Product"

		expect(page).to have_content("Product has not been updated.")

	end
end