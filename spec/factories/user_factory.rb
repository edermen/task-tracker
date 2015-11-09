FactoryGirl.define do

	# USER FACTORIES
	factory :user do
		id 					{ Faker::Number.number(2) }
		login  			{ Faker::Name.name }
		email 			{ Faker::Internet.email  }
		password    { Faker::Internet.password(8) }

		trait :empty_email do
			email 		nil
		end
	end

end