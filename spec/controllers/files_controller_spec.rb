require 'rails_helper'

RSpec.describe FilesController, type: :controller do
	let(:good_user) { FactoryGirl.create(:user) }
	let(:bad_user) { FactoryGirl.create(:user) }

	let(:product) { FactoryGirl.create(:product) }
	let(:review) { FactoryGirl.create(:review,
																		:product => product,
																		:user => good_user) }

	let(:path) { Rails.root + "spec/fixtures/update.txt" }
	let(:asset) do
		review.assets.create(asset: File.open(path))
	end

	before do
		good_user.permissions.create!(action: "view", thing: product)
	end

	context "users with access" do
		before do
			sign_in(good_user)
		end

		it "can access assets in a product" do
			get 'show', id: asset.id
			expect(response.body).to eq(File.read(path))
		end
	end	

	context "users without access" do
		before do
			sign_in(bad_user)
		end

		it "cannot access assets in a product" do
			get 'show', id: asset.id
			expect(response).to redirect_to(root_path)
			expect(flash[:alert]).to eq("The asset you were looking for " +
																	"could not be found.")
		end
	end
end
