FactoryGirl.define do
	factory :todo do
		name { Faker::Name.name }
		email { Faker::Internet.email}
		user_id { Faker::Number.number(10) }
		association :user
	end
end
