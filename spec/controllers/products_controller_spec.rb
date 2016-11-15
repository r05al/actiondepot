require 'rails_helper'

describe ProductsController do 
	it "displays and error for missing a project" do
		get :show, id: "not-real"
		expect(response).to redirect_to(products_path)
		message = "The product you were looking for does not exist."
		expect(flash[:alert]).to eql(message)
	end
end