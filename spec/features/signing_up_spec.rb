require 'rails_helper'

feature 'Signing up' do
	scenario 'Successful sign up' do
		visit '/'

		click_link 'Sign Up'
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign Up"

		expect(page).to have_content("You have successfully signed up.")
	end
end