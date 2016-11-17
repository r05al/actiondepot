require 'rails_helper'

describe ProductsController do 
	let(:user) { FactoryGirl.create(:user) }
	before do
		sign_in(user)
	end

	it "displays and error for missing a project" do
		get :show, id: "not-real"
		expect(response).to redirect_to(products_path)
		message = "The product you were looking for does not exist."
		expect(flash[:alert]).to eql(message)
	end

	context "standard users" do
		{ new: :get,
			create: :post,
			edit: :get,
			update: :put,
			destroy: :delete }.each do |action, method|
			it "cannot access the #{action} action" do
				send(method, action, :id => FactoryGirl.create(:product))

				expect(response).to redirect_to('/')
				expect(flash[:alert]).to eql("You must be an admin to do that.")
			end
		end

		it "cannot access the show actoin without permission" do
			product = FactoryGirl.create(:product)
			get :show, id: product.id

			expect(response).to redirect_to(products_path)
			expect(flash[:alert]).to eql("The product you were looking for does not exist.")
		end
	end

end