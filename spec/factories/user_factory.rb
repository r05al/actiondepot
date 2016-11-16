FactoryGirl.define do
	factory :user do
		name "joecool"
		email "joe@example.com"
		password "camellights"
		password_confirmation "camellights"
	end
end