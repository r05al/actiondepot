require 'rails_helper'

feature 'Viewing Products' do
	let!(:user) { FactoryGirl.create(:user) }
	let!(:product) { FactoryGirl.create(:product) }

	before do
		sign_in_as!(user)
		define_permission!(user, :view, product)
	end

	scenario 'List all products' do
		FactoryGirl.create(:product, title: "Hidden")
		visit '/'
		expect(page).to_not have_content("Hidden")
		click_link product.title

		expect(page.current_url).to eql(product_url(product))
	end
end