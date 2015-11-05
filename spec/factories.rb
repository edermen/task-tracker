FactoryGirl.define do
	factory :project do
		parent_id 	{ Faker::Number.digit }
    name 				{ "#{Faker::Hacker.verb} #{Faker::App.name} v:#{Faker::App.version}" }
    description { Faker::Lorem.sentence(24) }
	end

	factory :user do
		login  			{ Faker::Name.name }
		email 			{ Faker::Internet.email  }
		password    { Faker::Internet.password(8) }

		trait :without_email do
			email 		nil
		end
	end
end