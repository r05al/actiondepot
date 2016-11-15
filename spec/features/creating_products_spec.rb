require 'rails_helper'

feature 'Creating Products' do
	scenario 'can create a product' do
		visit '/'

		click_link 'New Product'

		fill_in 'Title', with: 'FlyZone 3000'
		fill_in 'Description', with: 'Fly higher'
		fill_in 'Image url', with: 'drone.jpg'
		fill_in 'Price', with: '999.95'
		click_button 'Create Product'

		expect(page).to have_content('Product was successfully created.')
	end
end