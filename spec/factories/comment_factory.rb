FactoryGirl.define do
	factory :comment do
		sequence(:rating) { |n| n }
		user
		body "Awful bike!"
		association :product
	end
end