FactoryGirl.define do
	factory :todo do
		name { Faker::Name.name }
		email { Faker::Internet.email}
		created_by { Faker::Number.number(10) }
	end
end
