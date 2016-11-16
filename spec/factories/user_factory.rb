FactoryGirl.define do
	sequence(:email) {|n| "user#{n}@example.com"}

	factory :user do
		name "joecool"
		email { generate(:email) }
		password "camellights"
		password_confirmation "camellights"

		factory :admin_user do
			admin true
		end
	end
end