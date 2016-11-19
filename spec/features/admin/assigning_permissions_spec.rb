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

  scenario "Creating tickets for a product" do
    check_permission_box "view", product
    check_permission_box "create_reviews", product
    click_button "Update"
    click_link "Sign Out"

    sign_in_as!(user)
    click_link product.title
    click_link "Review Product"
    fill_in "Title", with: "Blazing!"
    fill_in "Experience", with: "Best racer drone in the market."
    click_button "Create"

    expect(page).to have_content("Review has been created.")
  end

  scenario "Updating a review for a product" do
    check_permission_box "view", product
    check_permission_box "edit_reviews", product
    click_button "Update"
    click_link "Sign Out"

    sign_in_as!(user)
    click_link product.title
    click_link review.title
    click_link "Edit Review"
    fill_in "Title", with: "Super Blazing!"
    click_button "Update Review"
  end

  scenario "Deleting a review for a product" do
    check_permission_box "view", product
    check_permission_box "delete_reviews", product

    click_button "Update"
    click_link "Sign Out"

    sign_in_as!(user)
    click_link product.title
    click_link review.title
    click_link "Delete Review"

    expect(page).to have_content("Review has been deleted.")
  end
end