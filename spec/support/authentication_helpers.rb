require 'rails_helper'

module AuthenticationHelpers
	def sign_in_as!(user)
		visit '/login'
		fill_in "Name", with: user.name
		fill_in "Password", with: user.password
		click_button "Sign In"
		expect(page).to have_content("Signed in successfully.")
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end