require 'rails_helper'

feature 'Creating Products' do
	before do
		sign_in_as!(FactoryGirl.create(:admin_user))
		visit '/'

		click_link 'New Product'
	end
	scenario 'can create a product' do
		fill_in 'Title', with: 'FlyZone 3000'
		fill_in 'Description', with: 'Fly higher'
		fill_in 'Image url', with: 'drone.jpg'
		fill_in 'Price', with: '999.95'
		click_button 'Create Product'

		expect(page).to have_content('Product was successfully created.')
	
		product = Product.where(title: "FlyZone 3000").first

		expect(page.current_url).to eql(product_url(product))

		title = "FlyZone 3000 - Products - ActionDepot"
		expect(page).to have_title(title)
	end

	scenario "cannot create a product without a title, description, url, price" do
		click_button 'Create Product'

		expect(page).to have_content("Product has not been created.")
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Description can't be blank")		
		expect(page).to have_content("Image url can't be blank")
		expect(page).to have_content("Price is not a number")
	end
end