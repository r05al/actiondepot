require 'rails_helper'

feature 'Viewing Products' do
	scenario 'List all products' do
		product = FactoryGirl.create(:product, title: "FlyZone 3000")
		visit '/'
		click_link "FlyZone 3000"
		expect(page.current_url).to eql(product_url(product))
	end
end