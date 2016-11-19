require 'rails_helper'

feature "Assigining permissions" do
  let!(:admin) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product) }
  let!(:review) { FactoryGirl.create(:review, product: product, user: user) }

  before do
  	sign_in_as!(admin)

  	click_link "Admin"
  	click_link "Users"
  	click_link user.email
  	click_link "Permissions"
  end

  scenario "Viewing a product" do
  	check_permission_box "view", product

  	click_button "Update"
  	click_link "Sign Out"

  	sign_in_as!(user)
  	expect(page).to have_content(product.title)
  end
end