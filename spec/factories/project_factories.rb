FactoryGirl.define do

	# 	PROJECT FACTORIES
	factory :project do

		parent_id 	{ Faker::Number.digit }
		name 				{ "#{Faker::Hacker.verb} #{Faker::App.name} v:#{Faker::App.version}" }
		description { Faker::Lorem.sentence(24) }

		trait :empty_name do
			name nil
		end

		trait :empty_description do
			description nil
		end
	end

end