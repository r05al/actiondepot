require 'rails_helper'

feature "Viewing reviews" do
	before do
		hover_master = FactoryGirl.create(:product, title: "Hover Master")

		FactoryGirl.create(:review,
			product: hover_master,
			title: "best in line",
			experience: "Sometimes you hit the nail right on the head.")

		fireball = FactoryGirl.create(:product, title: "Fireball 8")

		FactoryGirl.create(:review,
			product: fireball,
			title: "burst into flames",
			experience: "literally, it burst into flames...")

		visit '/'
	end

	scenario "Viewing reviews for a given product" do
		click_link "Hover Master"

		expect(page).to have_content("best in line")
		expect(page).to_not have_content("burst into flames...")

		click_link "best in line"
		within("#review h2") do
			expect(page).to have_content("best in line")
		end

		expect(page).to have_content("Sometimes you hit the nail right on the head.")
	end
end