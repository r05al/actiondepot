require 'rails_helper'

feature "hidden links" do
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:admin_user) }
	let(:product) { FactoryGirl.create(:product) }
	let(:review) { FactoryGirl.create(:review, product: product, user: user) }

	context "anonymous users" do
		scenario "cannot see the New Product link" do
			visit '/'
			assert_no_link_for "New Product"
		end

		scenario "cannot see the Edit Product link" do
			visit product_path(product)
			assert_no_link_for "Edit Product"
		end

		scenario "cannot see the Delete Product link" do
			visit product_path(product)
			assert_no_link_for "Delete Product"
		end
	end

	context "regular users" do
		before { sign_in_as!(user) }
		scenario "cannot see the New Product link" do
			visit '/'
			assert_no_link_for "New Product"
		end

		scenario "cannot see the Edit Product link" do
			visit product_path(product)
			assert_no_link_for "Edit Product"
		end

		scenario "cannot see the Delete Product link" do
			visit product_path(product)
			assert_no_link_for "Delete Product"
		end

		scenario "New review link is shown to a user with permission" do
			define_permission!(user, "view", product)
			define_permission!(user, "create reviews", product)
			visit product_path(product)
			assert_link_for "Review Product"
		end

		scenario "New review link is hidden from a user without permission" do
			define_permission!(user, "view", product)
			visit product_path(product)
			assert_no_link_for "Review Product"
		end

		scenario "Edit review link is shown to a user with permission" do
			review
			define_permission!(user, "view", product)
			define_permission!(user, "edit reviews", product)
			visit product_path(product)
			click_link review.title
			assert_link_for "Edit Review"
		end

		scenario "Edit review link is hidden from user without permission" do
			review
			define_permission!(user, "view", product)
			visit product_path(product)
			click_link review.title
			assert_no_link_for "Edit Review"
		end

		scenario "Delete review link is shown to a user with permission" do
			review
			define_permission!(user, "view", product)
			define_permission!(user, "delete reviews", product)
			visit product_path(product)
			click_link review.title
			assert_link_for "Delete Review"
		end

		scenario "Delete review link is hidden from users without permission" do
			review
			define_permission!(user, "view", product)
			visit product_path(product)
			click_link review.title
			assert_no_link_for "Delete Review"
		end
	end

	context "admin users" do
		before { sign_in_as!(admin) }
		scenario "can see the New Product link" do
			visit '/'
			assert_link_for "New Product"
		end

		scenario "can see the Edit Product link" do
			visit product_path(product)
			assert_link_for "Edit Product"
		end

		scenario "can see the Delete Product link" do
			visit product_path(product)
			assert_link_for "Delete Product"
		end

		scenario "New review link is shown to admins" do
			visit	product_path(product)
			assert_link_for "Review Product"
		end

		scenario "Edit review link is shown to admins" do
			review
			visit product_path(product)
			click_link review.title
			assert_link_for "Edit Review"
		end

		scenario "Delete review link is shown to admins" do
			review
			visit product_path(product)
			click_link review.title
			assert_link_for "Delete Review"
		end
	end

end