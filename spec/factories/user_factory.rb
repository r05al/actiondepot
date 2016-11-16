FactoryGirl.define do
	factory :user do
		name "joecool"
		email "joe@example.com"
		password "camellights"
		password_confirmation "camellights"

		factory :admin_user do
			admin true
		end
	end
end