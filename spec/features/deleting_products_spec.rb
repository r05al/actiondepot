require 'rails_helper'

feature 'Deleting Products' do
	scenario 'Updating a product' do
		FactoryGirl.create(:product, title: "FlyZone 3000")

		visit '/'
		click_link "FlyZone 3000"
		click_link "Delete Product"

		expect(page).to have_content("Product was successfully destroyed.")

		visit '/'

		expect(page).to have_no_content("FlyZone 3000")
	end
end