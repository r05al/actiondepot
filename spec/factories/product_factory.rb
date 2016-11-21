FactoryGirl.define do
	factory :product do
		title "BlackBird 5000"
		description "fastest there is"
		image_url Faker::Avatar.image("product-slug", "50x50", "jpg")
		price "5000.00"
	end
end